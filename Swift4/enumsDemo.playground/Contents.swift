//: Playground - noun: a place where people can play

import UIKit

enum Directions {
    case east
    case south
    case north
    case west
}


let mydirect = Directions.north

switch mydirect {
case Directions.east:
    print("move to east")
case Directions.south:
    print("move to south")
case Directions.north:
    print("move to north")
case Directions.west:
    print("move to west")
default:
    print("not defines")
}
