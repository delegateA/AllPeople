//
//  ListClassCell.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/21.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit
import Kingfisher
class ListClassCell: UICollectionViewCell {
    var scrollView: UIScrollView?
    var dict = [DirectData]()
    override init(frame: CGRect) {
        super.init(frame: frame)
        scrollView = UIScrollView(frame: CGRectMake(0, 0, ScreenWidth, self.frame.size.height))
        self.addSubview(scrollView!)
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.bounces = false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func releaseData(abcd:NSArray) {
       
        dict = abcd  as! [DirectData]
        for  i in 0 ..< abcd.count {
            let btn = UIButton()
            btn.frame = CGRectMake(10+(ScreenWidth/5+20) * CGFloat(i), 0, ScreenWidth/5, ScreenWidth/5)
            let c = dict[i].TWO
            let imgView = UIImageView()
            imgView.frame = CGRectMake(10, 10, ScreenWidth/7, ScreenWidth/7)
            imgView.layer.cornerRadius = (imgView.frame.size.width)/2
            imgView.layer.masksToBounds = true
            imgView.backgroundColor=UIColor.grayColor()
            print(c.slug)
            imgView.kf_setImageWithURL(NSURL(string: c.slug!)!)

            imgView.userInteractionEnabled = true
            
            btn.addSubview(imgView)
            let label = UILabel()
            label.frame = CGRectMake(0, ScreenWidth/7+15, ScreenWidth/5, 20)
            btn.addSubview(label)
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColor.redColor()
            label.text = c.name
            label.font = UIFont.systemFontOfSize(16)
            
            scrollView?.addSubview(btn)
            
        }
        scrollView?.contentSize = CGSizeMake(ScreenWidth/4*CGFloat(abcd.count)+20, 0)
    
    
    }
}
