//
//  ViewController.swift
//  ChatApp
//
//  Created by hussien alrubaye on 6/24/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var ref = FIRDatabaseReference.init()
    @IBOutlet weak var txtChatText: UITextField!
    var UserName:String?
    @IBOutlet weak var laChatList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginAnony()
        
        self.ref = FIRDatabase.database().reference()
        
        laChatList.delegate = self
        laChatList.dataSource = self
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfChatInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellChat:TVCChat = tableView.dequeueReusableCell(withIdentifier: "cellChat", for: indexPath) as! TVCChat
        cellChat.setChat(chat: listOfChatInfo[indexPath.row])
        return cellChat
    }
    
    var listOfChatInfo = [Chat]()
    func loadChatRoom(){
        
        self.ref.child("chat").queryOrdered(byChild: "postDate").observe( .value, with:
            { ( snapshot ) in
                //
                self.listOfChatInfo.removeAll()
                
                if let snapshot =  snapshot.children.allObjects as? [FIRDataSnapshot]{
                    
                    for snap in snapshot {
                        
                        if let postData = snap.value as? [String:AnyObject]{
                            
                            let username = postData["name"] as? String
                            let text = postData["text"] as? String
                            
                            var postDate:CLong?
                            if let postdateIn = postData["postDate"] as? CLong {
                                postDate = postdateIn
                            }
                            
                            self.listOfChatInfo.append(Chat(userName: username!, text: text!, datePost: "\(postDate!)"))
                        }
                        
                    }
                    self.laChatList.reloadData()
                    let indexpath = IndexPath(row: self.listOfChatInfo.count-1, section: 0)
                    self.laChatList.scrollToRow(at: indexpath, at: .bottom, animated: true)
                }
                
        })
    }
    
    
    func loginAnony(){
        FIRAuth.auth()?.signInAnonymously(){
            (user,error) in
            // code here
            
            if let error = error {
                print("Cannot login: \(error)")
            }else{
                print("user UID \(user?.uid)")
                self.loadChatRoom()
            }
            
    }
    }
    
    
    
    @IBAction func buSendToRoom(_ sender: Any) {
        let dic = [ "text" : txtChatText.text,
                    "name" : UserName!,
        "postDate" : FIRServerValue.timestamp()] as [String:Any]
        self.ref.child("chat").childByAutoId().setValue(dic)
        
    }
    

}

