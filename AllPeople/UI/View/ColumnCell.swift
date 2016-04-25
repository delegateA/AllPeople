//
//  ColumnCell.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/23.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit
import Kingfisher
class ColumnCell: UICollectionViewCell {
    
    var bgView: UIView?
    var imgView:UIImageView?
    var label:  UILabel?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bgView = UIView()
        self.contentView.addSubview(bgView!)
        bgView?.snp_makeConstraints(closure: { (make) in
            make.right.left.top.bottom.equalTo(self)
        })
        
        
        label = UILabel()
        bgView?.addSubview(label!)
        label?.snp_makeConstraints(closure: { (make) in
            make.left.right.bottom.equalTo(bgView!)
            make.height.equalTo(20)
        })
        
        imgView = UIImageView()
        bgView?.addSubview(imgView!)
        
        imgView?.snp_makeConstraints(closure: { (make) in
            make.left.right.top.equalTo(bgView!)
            make.bottom.equalTo((label?.snp_top)!)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func releaseData(columnData:ColumnMode) {
        
        if columnData.image != nil {
            imgView?.kf_setImageWithURL(NSURL(string: columnData.image!)!)
        }
       
        if columnData.name != nil {
            label!.text = columnData.name
            
        }
        
    }
    
    
}
