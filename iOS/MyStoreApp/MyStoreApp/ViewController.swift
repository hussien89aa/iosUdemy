//
//  ViewController.swift
//  MyStoreApp
//
//  Created by hussien alrubaye on 6/19/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    
    @IBOutlet weak var txtStoreName: UITextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func buAddStore(_ sender: Any) {
        //TODO: ADD store
        let newStore = StoreType(context: context)
        newStore.store_name = txtStoreName.text
        do{
          try  ad.saveContext()
            txtStoreName.text = ""
        }catch {
            print("cannot save record")
        }
    }
    
    
    @IBAction func buBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
}

