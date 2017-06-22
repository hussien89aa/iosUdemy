//
//  ViewController.swift
//  TwitteriOSDemo
//
//  Created by hussien alrubaye on 6/21/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    
    @IBOutlet weak var txtFullName: UITextField!
    
    @IBOutlet weak var iv_userImage: UIImageView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    var imagePicker:UIImagePickerController!
    var ref = FIRDatabaseReference.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        self.ref = FIRDatabase.database().reference()
        
        
        if let user = FIRAuth.auth()?.currentUser{
            self.UserUID = user.uid
            print("user login:\(String(describing: self.UserUID))" )
            GotToPosting()
        }
    }

    @IBAction func buPickImage(_ sender: Any) {
        
       present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
           iv_userImage.image = image
            
            
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    var UserUID:String?
    @IBAction func buLogin(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: txtEmail.text!, password: txtPassword.text!){
            (user,error) in
            //write my code
            if let error = error {
                print(error)
            }else{
                print("user UID: \(user?.uid)")
                self.UserUID = user!.uid
                self.GotToPosting()
                
            }
        }
    }
    
    @IBAction func buRegister(_ sender: Any) {
        
        FIRAuth.auth()?.createUser(withEmail: txtEmail.text!, password: txtPassword.text!){
            (user,error) in
            //write my code
            if let error = error {
                print(error)
            }else{
                print("user UID: \(user?.uid)")
                 self.UserUID = user!.uid
                
                self.uploadUserImage()
                
                self.GotToPosting()
            }
        }
    }
    
    func SaveToFirebaseDatabase(UserImagePath:String,UserName:String){
        let msg = [ "fullName":UserName,
                    "UserImagePath": UserImagePath]
        self.ref.child("Users").child(self.UserUID!).setValue(msg)
    }
    
    
    func uploadUserImage(){
        // upload your image
        // upload image to firebase
        let image:UIImage =  iv_userImage.image!
        let storgaeRef = FIRStorage.storage().reference(forURL :"gs://myiosapps-78d8a.appspot.com")
        var data = NSData()
        data =  UIImageJPEGRepresentation(image, 0.8)! as NSData
        let dataformat = DateFormatter()
        dataformat.dateFormat = "MM_DD_yy_h_mm_a"
        let imageName = "\(self.UserUID!)_ \(dataformat.string(from: NSDate() as Date))"
        let imagepath = "UsersImages/\(imageName).jpg"
        let childUserImages = storgaeRef.child(imagepath)
        let metaData = FIRStorageMetadata()
        metaData.contentType = "image/jpeg"
        //upload image
        childUserImages.put(data as Data, metadata: metaData)
        
        //save to database
        SaveToFirebaseDatabase(UserImagePath: imagepath, UserName:  txtFullName.text!)
    }
    
    func GotToPosting(){
        
        performSegue(withIdentifier: "ShowPosts", sender:self.UserUID )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowPosts" {
            
            if let vcposting = segue.destination as? VCPosting {
                if let userUID = sender as? String {
                    vcposting.UserUID = userUID
                }
            }
        }

    }
    
    
    
    
}

