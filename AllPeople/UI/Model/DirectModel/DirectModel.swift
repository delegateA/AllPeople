//
//  DirectModel.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/21.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class DirectModel: NSObject {
    
    var title: String?
    var thumb: String?
    
    func mapping(map:Dictionary<String,AnyObject>){
        title = map["title"] as? String
        thumb = map["thumb"] as? String
    }
}

struct DirectHeaderModel {
    var name: String?
    var slug: String?
    
    mutating func mapping(map: Dictionary<String,AnyObject>) {
         name = map["title"] as? String
          slug = map["thumb"] as? String
    }
}

struct DirectListClass {
    var title: String?
    var thnumb: String?
    
    mutating func mapping(map: Dictionary<String,AnyObject>) {
       title = map["name"] as? String
        thnumb = map["slug"] as? String
    }
}

struct DirectMovieModel {
    var avatar: String?
    var thumb: String?
    var title:  String?
    var nick:   String?
    var view:   String?
    var uid:    String?
    
    mutating func mapping(map: Dictionary<String,AnyObject>) {
        title = map["link_object"]!["title"] as? String
        thumb = map["link_object"]!["thumb"] as? String
        view = map["link_object"]!["view"] as? String
        uid = map["link_object"]!["uid"] as? String
        avatar = map["link_object"]!["avatar"] as? String
        nick = map["link_object"]!["nick"] as? String
    }
    
}

class DirectData: NSObject {
    
    var ONE = DirectModel()
    var TWO = DirectHeaderModel()
    var THREE  = DirectListClass()
    var FOUR = DirectMovieModel()

}