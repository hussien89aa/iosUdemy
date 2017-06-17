//
//  Pockemons.swift
//  Pockemon
//
//  Created by hussien alrubaye on 6/17/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit

class Pockemons {
    var latitiude:Double?
    var longitude:Double?
    var image:String?
    var name:String?
    var des:String?
    var power:Double?
    var isCatch:Bool?
    init(latitiude:Double,longitude:Double,image:String,name:String,des:String,power:Double) {
        self.latitiude=latitiude
        self.longitude=longitude
        self.image=image
        self.name=name
        self.des=des
        self.power=power
        self.isCatch=false
    }
    
}
