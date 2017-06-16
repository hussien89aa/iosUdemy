//: Playground - noun: a place where people can play

import UIKit

func sub(n1:Int, n2:Int){
    let subValues = n1 - n2
    print("sub=\(subValues)")
}
func sub(n1:Double, n2:Double){
    let subValues = n1 - n2
    print("sub=\(subValues)")
}

func sub(n1:Int, n2:Double){
    let subValues = Double(n1) - n2
    print("sub=\(subValues)")
}
sub(n1: 10.10, n2: 10.6)
sub(n1: 10, n2: 6)
sub(n1: 11, n2: 10.6)
