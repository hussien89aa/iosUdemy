//: Playground - noun: a place where people can play

import UIKit

extension Double{
    
    func roundTo(places:Int) -> Double {
        let dvisor:Double = pow(10.0,Double( places))
        return (self * dvisor).rounded()
    }
}

let number:Double = 10.63535

print(number.roundTo(places: 3))
