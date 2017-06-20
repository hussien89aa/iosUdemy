//
//  VCAddItem.swift
//  MyStoreApp
//
//  Created by hussien alrubaye on 6/20/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import CoreData
class VCAddItem: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    @IBOutlet weak var ivShowImage: UIImageView!
    
    @IBOutlet weak var txtItemName: UITextField!
    
    @IBOutlet weak var StoresPickView: UIPickerView!
    var imagePicker:UIImagePickerController!
    var listOFStores = [StoreType]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStores()
        StoresPickView.delegate = self
        StoresPickView.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func loadStores(){
        
        let fetchRequest: NSFetchRequest<StoreType> = StoreType.fetchRequest()
        do{
            listOFStores = try context.fetch(fetchRequest)
        }catch{
            print("cannot load stores")
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOFStores.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = listOFStores[row]
        return store.store_name
    }
    
    

    @IBAction func buSelectPicture(_ sender: Any) {
        //TODO: select image from phone
       present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ivShowImage.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func buSave(_ sender: Any) {
        
        let newItem = Items(context:context)
        newItem.item_name = txtItemName.text
        newItem.date_add = NSDate() as? Date
        newItem.image = ivShowImage.image
        newItem.toStoreType = listOFStores[ StoresPickView.selectedRow(inComponent: 0)]
        do{
            try ad.saveContext()
            txtItemName.text = ""
            
        }catch {
            print("Error cannot save item")
        }
        
    }
    
    
    @IBAction func buBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
