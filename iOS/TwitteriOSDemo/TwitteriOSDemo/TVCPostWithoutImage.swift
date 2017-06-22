//
//  TVCPostWithoutImage.swift
//  TwitteriOSDemo
//
//  Created by hussien alrubaye on 6/21/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import Firebase
class TVCPostWithoutImage: UITableViewCell {
    @IBOutlet weak var txtPersonName: UILabel!
    
    @IBOutlet weak var txtPostDate: UILabel!
    @IBOutlet weak var ivPersonImage: UIImageView!
    @IBOutlet weak var txtPostText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setText(post:Post){
        txtPostText.text = post.postText
        txtPostDate.text = post.postDate!
        loadPostFormFirebase(userUID:post.userUID!)
    }
    
    var ref = FIRDatabaseReference.init()
    func loadPostFormFirebase(userUID:String){
        self.ref = FIRDatabase.database().reference()
        self.ref.child("Users").child(userUID).observe(.value, with: {
            (snapshot) in
            
            
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snapshot{
                    
                    if let postKey = snap.key as? String{
                        
                        if postKey == "fullName" {
                            let fullName = snap.value as? String
                            
                            self.txtPersonName.text = fullName
                        }
                        if postKey == "UserImagePath" {
                            let UserImagePath =  snap.value as? String
                            
                            self.setUserImage(url:UserImagePath!)
                        }
                        
                    }
                }
                
            }
            
        })
    }
    
    
    func setUserImage(url:String){
        let storageRef = FIRStorage.storage().reference(forURL: "gs://myiosapps-78d8a.appspot.com")
        let postImageRef = storageRef.child(url)
        postImageRef.data(withMaxSize: 8 * 1024 * 1024){
            data, error in
            
            if let error = error{
                print("cannot load image")
            }else{
                self.ivPersonImage.image = UIImage(data:data!)
            }
            
        }
    }

}
