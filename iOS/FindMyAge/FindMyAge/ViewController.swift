//
//  ViewController.swift
//  FindMyAge
//
//  Created by hussien alrubaye on 6/15/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var laShowAge: UILabel!
    @IBOutlet weak var txtYearOfBirth: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
    }

    
    @IBAction func BuFindDage(_ sender: Any) {
        
        GetAge()
    }
    
    func GetAge(){
        //fire click of button
        let yearOfBirth = Int(txtYearOfBirth.text!)
        //get current year
        let date = Date()
        let calender = Calendar.current
        let year = calender.component(.year, from: date)
        
        let personAge = year - yearOfBirth!
        laShowAge.text = "Your age is \(personAge)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        /// fire some click of return keybaord
        GetAge()
         self.view.endEditing(true)
        return true
    }

}

