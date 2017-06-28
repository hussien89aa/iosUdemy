//
//  VCLogin.swift
//  TicTacToeLocal
//
//  Created by hussien alrubaye on 6/28/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import Firebase
class VCLogin: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    var ref = FIRDatabaseReference.init()
    override func viewDidLoad() {
        super.viewDidLoad()
         self.ref = FIRDatabase.database().reference()
        // Do any additional setup after loading the view.
        if let user = FIRAuth.auth()?.currentUser {
            
            goToPlayGame()
        }
    }
    
    @IBAction func buRegister(_ sender: Any) {
        
        FIRAuth.auth()?.createUser(withEmail: txtEmail.text!, password: txtPassword.text!){
            (user,error) in
            
            if let error = error {
                print("cannot login:\(error)")
            }else{
                
                print("user uid \(user?.uid)")
                self.ref.child("tictactoe").child("users").child(self.SplitEmail(email: (user?.email)!)).child("Request").setValue((user?.uid)!)
                self.goToPlayGame()
            }
        }
    }
    
    func goToPlayGame(){
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "playGame", sender: nil)
        }
        
    }
    
    func SplitEmail(email:String)->String {
        let arrayEmail = email.split(separator: "@")
        return  String(arrayEmail[0])
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "playGame" {
            if let vcPlayGame = segue.destination as? ViewController {
                if let user = FIRAuth.auth()?.currentUser {
                    
                    vcPlayGame.UserUID = user.uid
                    vcPlayGame.UserEmail = user.email
                    
                }
            }
        }
    }
}
