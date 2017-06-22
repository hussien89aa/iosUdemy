//
//  Post.swift
//  TwitteriOSDemo
//
//  Created by hussien alrubaye on 6/21/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit

class Post {
    var postText:String?
    var userUID:String?
    var postDate:String?
    var postImage:String?
    init(postText:String,userUID:String,postDate:String,postImage:String) {
        self.postText=postText
        self.userUID=userUID
        self.postDate=postDate
        self.postImage=postImage
    }
}
