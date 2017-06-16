//: Playground - noun: a place where people can play

import UIKit

for count in 1...10{
    print("count break:\(count)")
    if count == 5 {
        print("found number:\(count)")
        break
    }
}

print("end break")

for count in 1...10{
    if count == 5 {
        continue
    }
    print("count continue:\(count)")
    
}
print("end continue")
