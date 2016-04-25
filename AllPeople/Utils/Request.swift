//
//  Request.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/25.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import Foundation
import Kingfisher
import Alamofire

class  request {
   
    init(){
    
    }
    class func defaultInstance() -> request {
         struct statics {
            static let instance  = request()
         }
    
          return statics.instance
    }

    func GetRequest(url:String)-> Request {
        return Alamofire.request(.GET, url)
    }
 
    func PostRequest(url:String)-> Request {
        return Alamofire.request(.POST, url)
    }

}