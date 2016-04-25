//
//  RequestData.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/21.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class RequestData: NSObject {
    
    weak var delegate:RequestDataDelegate?
    
    func requestData() {
       
        request.defaultInstance().GetRequest(DirectSeedingUrl).responseJSON { response in
            switch response.result {
            case.Success:
                guard let JsonData = response.result.value else { return }
                let direct_one = JsonData["app-index"] as? NSArray
                let direct_two = JsonData["app-classification"] as? NSArray
                let direct_three = JsonData["list"] as? NSArray
                
                var direct_model1 = [DirectModel]()
                var direct_model2 = [DirectHeaderModel]()
                var direct_model3 = [DirectListClass]()
                var direct_all1 = [DirectData]()
                var direct_all2 = [DirectData]()
                var direct_all3 = [DirectData]()
                for one in direct_one! {
                    let first = DirectModel()
                    first.mapping(one as! Dictionary<String,AnyObject>)
                    direct_model1.append(first)
                }
                
                for two in direct_two! {
                    var second = DirectHeaderModel()
                    second.mapping(two as! Dictionary<String,AnyObject>)
                    direct_model2.append(second)
                }
                
                for three in direct_three! {
                    var thrid = DirectListClass()
                    thrid.mapping(three as! Dictionary<String,AnyObject>)
                    direct_model3.append(thrid)
                }
                
                for directData in direct_model1 {
                     let direct = DirectData()
                    direct.ONE = directData
                    direct_all1.append(direct)
                }
                
                for directData in direct_model2 {
                    let direct = DirectData()
                    direct.TWO = directData
                    direct_all2.append(direct)
                }
                
                for directData in direct_model3 {
                    let direct = DirectData()
                    direct.THREE = directData
                    direct_all3.append(direct)
                }
                
                let classArray = ["app-recommendation","app-lol","app-beauty","app-webgame","app-dota2","app-heartstone","app-tvgame","app-blizzard","app-sport","app-dnf","app-minecraft"]
                var directSex = [NSArray]()
                for i in 0  ..< classArray.count  {
                    let direct_new = JsonData[classArray[i]] as? NSArray
                    var direct_model = [DirectMovieModel]()
                    var direct_all = [DirectData]()

                    for four in direct_new! {
                        
                        var new = DirectMovieModel()
                        new.mapping(four as! Dictionary<String,AnyObject>)
                        print(new.avatar)
                        direct_model.append(new)
                    }
                    for directData in direct_model {
                        let direct = DirectData()
                        direct.FOUR = directData
                        print(direct.FOUR.avatar)
                        direct_all.append(direct)
                    }
                    directSex.append(direct_all)
                }
                
                
                let direct_all:(NSArray) = [direct_all1,direct_all2,direct_all3,directSex]
                self.delegate?.request(direct_all)

            case .Failure(let error):
                print(error)
            
            
            }
            
        }
    }
}

protocol RequestDataDelegate: NSObjectProtocol {
    
    func request(directAll:NSArray)
    
}
