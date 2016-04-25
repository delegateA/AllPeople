//
//  HomeHeaderView.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/21.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//  滚动广告视图

import UIKit
import Kingfisher

class HomeHeaderView: UICollectionViewCell,UIScrollViewDelegate {

    weak var delegate:HomeHeaderDelegate?
    
    var homeRollDataArray = [DirectData]()
    var scrollView:UIScrollView?
    var pageControl:UIPageControl?
    var timer:NSTimer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = BgColor
        setUI()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setUI(){
        
        scrollView = UIScrollView()
        scrollView?.scrollsToTop = false
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.pagingEnabled = true
        scrollView?.delegate = self
        self.addSubview(scrollView!)
        scrollView?.snp_makeConstraints(closure: { (make) -> Void in
            make.top.left.right.bottom.equalTo(self).offset(0)
        })
        
        pageControl = UIPageControl()
        pageControl?.userInteractionEnabled = false
        pageControl?.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl?.currentPageIndicatorTintColor = UIColor.redColor()
        self.addSubview(pageControl!)
        pageControl?.snp_makeConstraints(closure: { (make) -> Void in
            make.bottom.equalTo(self)
            make.centerX.equalTo(self.snp_centerX).offset(0)
        })
        
        let tapGestureRecognize = UITapGestureRecognizer(target: self, action: #selector(HomeHeaderView.singleTapGestureRecognizer))
        tapGestureRecognize.numberOfTapsRequired = 1;
        scrollView?.addGestureRecognizer(tapGestureRecognize)
        
    }
    
    
    func addTimer(){
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(HomeHeaderView.nextImage(_:)), userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
    }
    
    func removeTimer(){
        timer!.invalidate()
    }
    
    func nextImage(sender:AnyObject!){
        
        var page:Int = pageControl!.currentPage
        if(page == homeRollDataArray.count-1){
            page = 0
        }else{
            page += 1
        }
        let x:CGFloat = CGFloat(page) * scrollView!.frame.size.width
        scrollView!.contentOffset = CGPointMake(x, 0)
        
    }
    
    func reloadData(daArray: NSArray){
        homeRollDataArray = daArray as! [DirectData]
        print(daArray.count)
        addTimer()
        
        for i in 0 ..< daArray.count {
            
            let homeData = daArray[i] as! DirectData
            
            let imageView = UIImageView(frame: CGRectMake(CGFloat(i) * scrollView!.frame.size.width, 0, scrollView!.frame.size.width, scrollView!.frame.size.height))
               imageView.backgroundColor=UIColor.redColor()
            print(homeData.ONE.thumb)
//            imageView.kf_setImageWithURL(NSURL(string: homeData.ONE.thumb!)!)

            
            imageView.userInteractionEnabled = true

            scrollView?.addSubview(imageView)
        }
        
        scrollView?.contentSize = CGSizeMake(scrollView!.frame.size.width * CGFloat(daArray.count), scrollView!.frame.size.height)
        scrollView?.contentOffset = CGPointMake(0, 0)
        
        pageControl?.numberOfPages = daArray.count
        pageControl!.currentPage = 0;
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollviewW:CGFloat = scrollView.frame.size.width
        let x:CGFloat = scrollView.contentOffset.x
        let page:Int = (Int)((x + scrollviewW / 2) / scrollviewW)
        pageControl!.currentPage = page
    }
    
//    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
//
//        removeTimer()
//    }
//    
//    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        addTimer()
//    }

    
    func singleTapGestureRecognizer() {
        let page = (Int)(scrollView!.contentOffset.x / scrollView!.frame.size.width)
        let homeRoll = homeRollDataArray[page]
        self.delegate?.homeHeaderRequestResult(homeRoll)
    }
    
}

protocol HomeHeaderDelegate: NSObjectProtocol {
    
    func homeHeaderRequestResult(homeRollData:DirectData)
    
}
