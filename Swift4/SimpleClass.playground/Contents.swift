//: Playground - noun: a place where people can play

import UIKit

 class Car{
//properties
    var type:String?
    var model:Int?
    var price:Double?
    var milesDrive:Int?
    var owner:String?
    
    init() {
        print("class is created")
    }
    init(type:String,model:Int,price:Double,milesDrive:Int,owner:String) {
        self.type=type
        self.model=model
        self.price=price
        self.milesDrive=milesDrive
        self.owner=owner
    }

//methods
    func getPrice() -> Double {
        let newPrice = price! - (Double(milesDrive!) * 10)
        return newPrice
    }
    
     func getOwner() -> String {
        return owner!
    }
}
 

class Track:Car{
    func getModel() -> Int {
        return model!
    }
    
   override func getPrice() -> Double {
        let newPrice = price! - (Double(milesDrive!) * 20)
        return newPrice
    }
    
   override  init(type:String,model:Int,price:Double,milesDrive:Int,owner:String) {
         print("Track is created")
         super.init(type: type, model: model, price: price, milesDrive: milesDrive, owner: owner)
    }
}
print("Car1")
// create instance
let car1=Car(type: "BMW", model: 2016, price: 10000.2, milesDrive: 20, owner: "Hussein Alrubaye")
print(car1.getPrice())
print(car1.getOwner())

print("Car2")
let car2=Car()
car2.type="Sony"
car2.model=2017
car2.price=10002.2
car2.milesDrive=70
car2.owner="Jena Alrubaye"
print(car2.getPrice())
print(car2.getOwner())


print("Track")
// create instance
let track=Track(type: "BMW", model: 2016, price: 10000.2, milesDrive: 20, owner: "Hussein Alrubaye")
print("Track price \( track.getPrice() )")
print("Track owner \( track.getOwner() )")
print("Track model \( track.getModel() )")

print("Track cast to car")
// create instance
let carCast=Track(type: "BMW", model: 2016, price: 10000.2, milesDrive: 20, owner: "Hussein Alrubaye") as Car
print("Track price \( carCast.getPrice() )")
print("Track owner \( carCast.getOwner() )")


