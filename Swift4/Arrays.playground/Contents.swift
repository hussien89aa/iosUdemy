//: Playground - noun: a place where people can play

import UIKit

let number1 = 10
let number2 = 20
let number3 = 30
let number4 = 40
let number5 = 50
print(number1)
print(number2)
print(number3)
print(number4)
print(number5)

var ar=[10,20,30,40,50]
for item in ar {
    print("ar:\(item)")
}
ar[4] = 90
for index in 0...4{
    print("arr[ \(index)]=\(ar[index])")
}
///

var  names=[String]()
names.append("Hussein")
names.append("Jena")
names.append("Laya")
names.append("Ahmed")
names.remove(at: 1)
for name in names {
    print(name)
}


var ar2:Any=[1.1,1,"shdjsd",true]




