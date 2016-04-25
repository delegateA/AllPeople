//
//  LabelReusableView.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/22.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class LabelReusableView: UICollectionReusableView {
    var topLabel: UILabel?
    var leftLabel:UILabel?
    var nameLabel:UILabel?
    var btn:      UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        topLabel = UILabel()
        self.addSubview(topLabel!)
        topLabel?.snp_makeConstraints(closure: { (make) in
            make.left.right.top.equalTo(self)
            make.height.equalTo(6)
        })
        topLabel?.backgroundColor = UIColor.grayColor()
        leftLabel = UILabel()
        self.addSubview(leftLabel!)
        leftLabel?.snp_makeConstraints(closure: { (make) in
            make.right.equalTo(self.snp_left).offset(15)
            make.width.equalTo(5)
            make.centerY.equalTo(self.snp_centerY).offset(6)
            make.height.equalTo(20)
        })
        leftLabel?.backgroundColor = UIColor.redColor()
        
        nameLabel = UILabel()
        self.addSubview(nameLabel!)
        nameLabel?.snp_makeConstraints(closure: { (make) in
            make.width.equalTo(70)
            make.centerY.equalTo((leftLabel?.snp_centerY)!)
            make.height.equalTo(20)
            make.left.equalTo((leftLabel?.snp_right)!).offset(15)
        })
        
        btn = UIButton()
//        btn?.backgroundColor = UIColor.greenColor()
        btn?.setTitle("进去看看", forState: UIControlState.Normal)
        btn?.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn?.titleLabel?.font = UIFont.systemFontOfSize(14)
        self.addSubview(btn!)
        btn?.snp_makeConstraints(closure: { (make) in
            make.right.equalTo(-8)
            make.width.equalTo(70)
            make.centerY.equalTo((leftLabel?.snp_centerY)!)
            make.height.equalTo(20)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func releaseData(movieData:DirectData) {
        
       nameLabel?.text = movieData.THREE.title
            
      
        
    }

}
