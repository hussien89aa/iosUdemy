//
//  VCFoodDetails.swift
//  FoodApp
//
//  Created by hussien alrubaye on 6/24/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit

class VCFoodDetails: UIViewController {
    
    @IBOutlet weak var iv_FoodImage: UIImageView!
    
    @IBOutlet weak var laFoodDes: UITextView!
    @IBOutlet weak var laFoodName: UILabel!
    var food:Food?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        laFoodName.text = food?.name!
        laFoodDes.text = food?.des!
        iv_FoodImage.image = UIImage(named: (food?.image!)!)
        // Do any additional setup after loading the view.
    }

    
    @IBAction func buBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
