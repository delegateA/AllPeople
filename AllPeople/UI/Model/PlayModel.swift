//
//  PlayModel.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/25.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class PlayModel: NSObject {

    
    var avatar: String?
    var thumb: String?
    var title:  String?
    var nick:   String?
    var view:   String?
    var uid:    String?
    
    func mapping(map: Dictionary<String,AnyObject>) {
        title = map["title"] as? String
        thumb = map["thumb"] as? String
        view = map["view"] as? String
        uid = map["uid"] as? String
        avatar = map["avatar"] as? String
        nick = map["nick"] as? String
    }

}
