//
//  ViewController.swift
//  ImageDefineML
//
//  Created by hussien alrubaye on 7/24/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import CoreML
import Vision
import AVFoundation
class ViewController: UIViewController,UINavigationControllerDelegate,
UIImagePickerControllerDelegate{

    @IBOutlet weak var laImageDes: UITextView!
    @IBOutlet weak var imageViewObject: UIImageView!
    var imagePicker:UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker=UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buTakePicture(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
      
        imageViewObject.image=info[UIImagePickerControllerOriginalImage] as? UIImage
        imagePicker.dismiss(animated: true, completion: nil)
        pictureIdentifyML(image: (info[UIImagePickerControllerOriginalImage] as? UIImage)!)
        
    }
    
    
    func pictureIdentifyML(image:UIImage){
       
        guard let model = try? VNCoreMLModel(for:Resnet50().model) else {
            fatalError(" cannot load ML model")
        }
        
        let request = VNCoreMLRequest(model:model){
            [ weak self] request, error in
            
            guard let results = request.results as? [VNClassificationObservation],
                let firstResult = results.first else{
                   fatalError("cannot get result from VNCoreMLRequest")
            }
            
            
            DispatchQueue.main.async {
                 self?.laImageDes.text = "confidence = \( Int(firstResult.confidence * 100))% , \n identifire \((firstResult.identifier))"
                // text to speach
                 let utTerance = AVSpeechUtterance(string: (self?.laImageDes.text)!)
                utTerance.voice = AVSpeechSynthesisVoice(language: "en-gb")
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utTerance)
            }
        }
        
        
        guard let ciImage = CIImage(image:image) else {
            fatalError(" cannot convert to CIImage")
        }
        let imageHandler = VNImageRequestHandler(ciImage:ciImage)
        
        DispatchQueue.global(qos: .userInteractive).async {
            do{
                try imageHandler.perform([request])
            }catch{
                print("Error \(error)")
            }
        }
        
    }
    
}

