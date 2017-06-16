//: Playground - noun: a place where people can play

import UIKit

protocol Operations{
    func add(n1:Int,n2:Int)->Int
    func sub(n1:Int,n2:Int)->Int
}

class MathOperations:Operations{
    func add(n1: Int, n2: Int) -> Int {
        return n1 + n2
    }
    
    func sub(n1: Int, n2: Int) -> Int {
          return n1 - n2
    }
}
class LogicOperations:Operations{
    func add(n1: Int, n2: Int) -> Int {
        return n1 + n2 + 10
    }
    
    func sub(n1: Int, n2: Int) -> Int {
        return n1 - n2 - 10
    }
}

let mathOp = MathOperations()
print(mathOp.add(n1: 3, n2: 10))

let logicOp = LogicOperations()
print(logicOp.add(n1: 3, n2: 10))




