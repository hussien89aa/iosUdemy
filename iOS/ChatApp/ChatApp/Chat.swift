//
//  Chat.swift
//  ChatApp
//
//  Created by hussien alrubaye on 6/24/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit

class Chat  {
    var userName:String?
    var text:String?
    var datePost:String?
    init(userName:String,text:String,datePost:String) {
        self.userName =  userName
        self.text =  text
        self.datePost = datePost
    }
}
