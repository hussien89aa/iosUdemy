//
//  ViewController.swift
//  FoodApp
//
//  Created by hussien alrubaye on 6/24/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   var listOfFoods = [Food]()
    @IBOutlet weak var cvListOfFoods: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFoodsFromPropertyList()
        
        cvListOfFoods.delegate = self
        cvListOfFoods.dataSource = self
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfFoods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellFood:CVCFood = collectionView.dequeueReusableCell(withReuseIdentifier: "cellFood", for: indexPath) as! CVCFood
         cellFood.setFood(food: listOfFoods[indexPath.row])
        return cellFood
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showDetails", sender: listOfFoods[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetails" {
            if let dis =  segue.destination as? VCFoodDetails {
                if let food = sender as? Food {
                    dis.food = food
                }
            }
        }
    }
    
    func loadFoodsFromPropertyList(){
     let path = Bundle.main.path(forResource: "Foods", ofType: "plist")! as String
        let url = URL(fileURLWithPath: path)
        
        do{
            let data = try Data(contentsOf:url)
            let plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
            let dicArray = plist as! [[String:String]]
            for food in dicArray {
               listOfFoods.append(Food(name: food["Name"]!, des: food["Des"]!, image: food["Image"]!))
            }
        }catch{
            print("cannot read file")
        }
    }


}

