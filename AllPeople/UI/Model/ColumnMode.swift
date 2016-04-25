//
//  ColumnMode.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/23.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class ColumnMode: NSObject {
   
    var name: String?
    var image: String?
    
    func mapping(map:Dictionary<String,AnyObject>){
        name = map["name"] as? String
        image = map["image"] as? String
    }

}
