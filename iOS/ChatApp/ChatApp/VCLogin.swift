//
//  VCLogin.swift
//  ChatApp
//
//  Created by hussien alrubaye on 6/24/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit

class VCLogin: UIViewController {
    @IBOutlet weak var laUserName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buLogin(_ sender: Any) {
        
        performSegue(withIdentifier: "chatRoom", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chatRoom" {
            
            if let dis = segue.destination as? ViewController {
                dis.UserName = laUserName.text
            }
        }
    }
    

}
