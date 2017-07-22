//
//  TVCAddPost.swift
//  TwitteriOSDemo
//
//  Created by hussien alrubaye on 6/21/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import Firebase
class TVCAddPost: UITableViewCell,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    @IBOutlet weak var txtPostText: UITextView!
    var ref = FIRDatabaseReference.init()
    var UserUID:String?
    var imagePath:String = "no image"
    var imagePicker:UIImagePickerController!
    var main:VCPosting?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buAttachImage(_ sender: Any) {
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        main!.present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            uploadUserImage(image:image )
            
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    func uploadUserImage(image:UIImage){
        // upload your image
        // upload image to firebase
        let storgaeRef = FIRStorage.storage().reference(forURL :"gs://myiosapps-78d8a.appspot.com")
        var data = NSData()
        data =  UIImageJPEGRepresentation(image, 0.8)! as NSData
        let dataformat = DateFormatter()
        dataformat.dateFormat = "MM_DD_yy_h_mm_a"
        let imageName = "\(self.UserUID!)_ \(dataformat.string(from: NSDate() as Date))"
        self.imagePath = "UsersPosts/\(imageName).jpg"
        let childUserImages = storgaeRef.child(self.imagePath)
        let metaData = FIRStorageMetadata()
        metaData.contentType = "image/jpeg"
        //upload image
        childUserImages.put(data as Data, metadata: metaData)
        
        
    }
    
    @IBAction func buPost(_ sender: Any) {
        ref = FIRDatabase.database().reference()
        var postMsg = ["userUID":UserUID!,
                      "text":txtPostText.text!,
                      "imagePath":imagePath,
        "postDate":FIRServerValue.timestamp()] as [String:Any]
        ref.child("Posts").childByAutoId().setValue(postMsg)
        imagePath = "no image"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
