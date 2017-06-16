//: Playground - noun: a place where people can play

import UIKit

var peopleAccounts=[10:"hussein",11:"Jena",50:"laya"]
print(peopleAccounts[11]!)
peopleAccounts[11]="Jena Hussein"
print(peopleAccounts[11]!)

// define without init
var ariportList = [String:String]()
ariportList["JFK"] = "Jon F Kened"
ariportList["BG"] = "Baghdad"

for (k,v) in ariportList{
    print("key \(k)")
     print("value \(v)")
}
