//
//  MovieCell.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/22.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    var bgView: UIView?
    var thumb:  UIImageView?
    var avatar: UIImageView?
    var title:  UILabel?
    var nick:   UILabel?
    var count:  UILabel?
    
    override  init(frame: CGRect) {
        super.init(frame: frame)
        
        bgView = UIView()
        bgView?.backgroundColor = UIColor.clearColor()
        self.contentView.addSubview(bgView!)
        bgView?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(self).offset(0)
            make.right.equalTo(self).offset(0)
            make.top.equalTo(self).offset(0)
            make.bottom.equalTo(self).offset(0)
        })
        
        count = UILabel()
        count?.text = "28888"
        count?.font = UIFont.systemFontOfSize(8)
        count?.textAlignment = NSTextAlignment.Center
        bgView?.addSubview(count!)
        count?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(10)
            make.width.equalTo(31)
            make.bottom.equalTo(bgView!).offset(-4)
            make.height.equalTo(10)
        })
        count?.backgroundColor = UIColor.lightGrayColor()
        
        title = UILabel()
        title?.font = UIFont.systemFontOfSize(8)
        bgView?.addSubview(title!)
        title?.snp_makeConstraints(closure: { (make) in
            make.right.equalTo(bgView!)
            make.left.equalTo(count!.snp_right).offset(4)
            make.centerY.equalTo((count?.snp_centerY)!)
            make.height.equalTo(10)
        })
        
        nick = UILabel()
        nick?.font = UIFont.systemFontOfSize(10)
        bgView?.addSubview(nick!)
        nick?.snp_makeConstraints(closure: { (make) in
            make.right.equalTo(bgView!).offset(5)
            make.left.equalTo((title?.snp_left)!)
            make.bottom.equalTo((title?.snp_top)!).offset(2)
            make.height.equalTo(20)
        })
        
        thumb = UIImageView()
        bgView?.addSubview(thumb!)
        thumb?.snp_makeConstraints(closure: { (make) in
            make.left.right.top.equalTo(bgView!)
            make.bottom.equalTo((nick?.snp_top)!).offset(1)
        })
        thumb?.layer.cornerRadius = 8
        thumb?.layer.masksToBounds = true
        avatar = UIImageView()
        avatar?.backgroundColor = UIColor.greenColor()
        bgView?.addSubview(avatar!)
        avatar?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(bgView!).offset(8)
            make.width.height.equalTo(35)
            make.bottom.equalTo((count?.snp_top)!).offset(-2)
        })
        avatar?.layer.cornerRadius=35/2
        avatar?.layer.masksToBounds = true
       
       
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bgView?.frame = self.bounds
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func releaseData(movieData:DirectData) {
        
        if movieData.FOUR.thumb != nil {
            thumb?.kf_setImageWithURL(NSURL(string: movieData.FOUR.thumb!)!)
            print(movieData.FOUR.thumb)
        }
        if movieData.FOUR.avatar != nil {
            avatar?.kf_setImageWithURL(NSURL(string:  movieData.FOUR
                .avatar!)!)
        }
        if movieData.FOUR.nick != nil {
            nick?.text = movieData.FOUR.nick
            print(nick?.text)
        }
        if movieData.FOUR.title != nil {
            title!.text = movieData.FOUR.title

        }
     
    }
    
    func releasePlayData(movieData:PlayModel) {
        
        if movieData.thumb != nil {
            thumb?.kf_setImageWithURL(NSURL(string: movieData.thumb!)!)
        }
        if movieData.avatar != nil {
            avatar?.kf_setImageWithURL(NSURL(string:  movieData
                .avatar!)!)
        }
        if movieData.nick != nil {
            nick?.text = movieData.nick
            print(nick?.text)
        }
        if movieData.title != nil {
            title!.text = movieData.title
            
        }
        
    }
    
}
