//
//  VCPosting.swift
//  TwitteriOSDemo
//
//  Created by hussien alrubaye on 6/21/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import Firebase
class VCPosting: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    @IBOutlet weak var tvListPosts: UITableView!
    var ref = FIRDatabaseReference.init()
    var UserUID:String?
    var listOfPosts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = FIRDatabase.database().reference()
        print("user uid: \(UserUID!)")
        
        listOfPosts.append(Post(postText: "", userUID: "@#$2@", postDate: "", postImage: ""))
        
        tvListPosts.delegate = self
        tvListPosts.dataSource = self
        // Do any additional setup after loading the view.
        loadPostFormFirebase()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = listOfPosts[indexPath.row]
       if (post.userUID! == "@#$2@" ){
        let cellAdd = tableView.dequeueReusableCell(withIdentifier: "cellAddPost", for: indexPath) as! TVCAddPost
        cellAdd.UserUID = self.UserUID
        cellAdd.main = self
        return cellAdd
       }else if(post.postImage == "no image"){
        //
           let cellwithOutImage = tableView.dequeueReusableCell(withIdentifier: "cellWithOutPost", for: indexPath) as! TVCPostWithoutImage
           cellwithOutImage.setText(post: post)
          return cellwithOutImage
       }else{
        let cellWithImage = tableView.dequeueReusableCell(withIdentifier: "cellWithImage", for: indexPath) as! TVCPostWithText
        cellWithImage.setText(post: post)
        return cellWithImage
        
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPostFormFirebase(){
        self.ref.child("Posts").queryOrdered(byChild: "postDate").observe(.value, with: {
            (snapshot) in
            self.listOfPosts.removeAll()
            self.listOfPosts.append(Post(postText: "", userUID: "@#$2@", postDate: "", postImage: ""))
            
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snapshot{
                    
                    if let postDic = snap.value as? [String:Any]{
                        var postText:String?
                        if let postTextF = postDic["text"] as? String {
                            postText = postTextF
                        }
                        
                         var userUID:String?
                        if let userUIDF = postDic["userUID"] as? String {
                            userUID = userUIDF
                        }
                         var postDate:CLong?
                        if let postDateF = postDic["postDate"] as? CLong {
                            postDate = postDateF
                        }
                         var postImage:String?
                        if let postImageF = postDic["imagePath"] as? String {
                            postImage = postImageF
                        }
                        let date = postDate!.getDateStringFromUTC()
                          self.listOfPosts.append(Post(postText: postText!, userUID: userUID!, postDate: "\(date)" , postImage: postImage!))
                    }
                }
                self.tvListPosts.reloadData()
                
            }
            
        })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let post = listOfPosts[indexPath.row]
        if (post.userUID! == "@#$2@" ){
            
            return 175
        }else if(post.postImage == "no image"){
            
            return 125
        }else{
            
            return 276
            
        }
    }
 

}
//convert CLong to date
extension CLong {
    func getDateStringFromUTC() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: date)
    }
}
