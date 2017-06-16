//: Playground - noun: a place where people can play

import UIKit

for index in 1...10{
    print("for:\(index)")
}

var count = 11 // init
while count <= 10 { // condition
    // block of code
        print("while:\(count)")
    count = count + 1 // inc
}

count = 11
repeat{
    // block of code
    print("repeat:\(count)")
    count = count + 1 // inc
}while count <= 10
