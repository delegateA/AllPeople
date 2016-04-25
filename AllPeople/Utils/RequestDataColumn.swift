//
//  RequestDataColumn.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/24.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class RequestDataColumn: NSObject {
    
    weak var delegate:RequestDataColumnDelegate?
    
    func requestData() {
        
        request.defaultInstance().GetRequest(ColumnUrl).responseJSON { response in
            switch response.result {
            case.Success:
                guard let JsonData = response.result.value else { return }
                let column = JsonData as! NSArray
                var modelArray = [ColumnMode]()

                for columnDic in column {
                    let data = ColumnMode()
                    data.mapping(columnDic as! Dictionary<String,AnyObject>)
                    modelArray.append(data)
                }
                
                
                
                self.delegate?.request(modelArray)
                
            case .Failure(let error):
                print(error)
                
                
            }
            
        }
    }

}

protocol RequestDataColumnDelegate: NSObjectProtocol {
    
    func request(directAll:NSArray)
    
}
