//
//  RequestPlayData.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/24.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class RequestPlayData: NSObject {

    weak var delegate:RequestPlayDataDelegate?
    
    func requestData() {
        
        request.defaultInstance().GetRequest(PlayUrl).responseJSON { response in
            switch response.result {
            case.Success:
                guard let JsonData = response.result.value else { return }
                let column = JsonData["data"] as! NSArray
                var modelArray = [PlayModel]()
                
                for four in column {
                    let new = PlayModel()
                    new.mapping(four as! Dictionary<String,AnyObject>)
                    modelArray.append(new)
                }
              
                
                self.delegate?.request(modelArray)
                
            case .Failure(let error):
                print(error)
                
                
            }
            
        }
    }

}

protocol RequestPlayDataDelegate: NSObjectProtocol {
    
    func request(directAll:NSArray)
    
}
