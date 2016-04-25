//
//  DirectViewController.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/20.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class DirectViewController: UIViewController {
    
    var collectionViewOld: UICollectionView?
    var homeRoolArray = [DirectData]()
    var titleArray = [DirectData]()
    var scrollArray = [DirectData]()
    var classArray:NSArray = [AnyObject]()
    let directRequest = RequestData()
    var flowLayoutOld = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BgColor
        self .reloadCollectionView()
    }
    
    func reloadCollectionView() {

        flowLayoutOld = UICollectionViewFlowLayout()
        collectionViewOld = UICollectionView(frame:view.bounds, collectionViewLayout: flowLayoutOld)
        collectionViewOld?.delegate = self
        collectionViewOld?.dataSource = self
        view.addSubview(collectionViewOld!)
        collectionViewOld?.backgroundColor = BgColor
         collectionViewOld!.registerClass(HomeHeaderView.self, forCellWithReuseIdentifier: "HomeHeaderView")
        collectionViewOld!.registerClass(ListClassCell.self, forCellWithReuseIdentifier: "ListClassCell")
        collectionViewOld!.registerClass(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        collectionViewOld?.registerClass(LabelReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "LabelReusableView")
        
        directRequest.delegate = self
        directRequest.requestData()
    }
    //顶部刷新
    func headerRefresh() {
        directRequest.requestData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
//MARK--获取数据
extension DirectViewController:RequestDataDelegate {

    func request(directAll: NSArray) {

        homeRoolArray = directAll[0] as! [DirectData]
        print(homeRoolArray.count)
        scrollArray = directAll[1] as! [DirectData]
        titleArray = directAll[2] as! [DirectData]
        classArray = directAll[3] as! NSArray
        collectionViewOld?.reloadData()
      
        
    }
}

//MARK: UICollectionDelegate
extension DirectViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ListClassCell", forIndexPath: indexPath) as! ListClassCell
            cell.backgroundColor = BgColor
            cell.releaseData(scrollArray)
            return cell
        }else if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HomeHeaderView", forIndexPath: indexPath) as! HomeHeaderView
            cell.reloadData(homeRoolArray)
            return cell
        }
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
            let arr = classArray[indexPath.section-2]
            let some = arr[indexPath.row] as! DirectData
            cell.releaseData(some)
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
         if indexPath.section == 1 {
            return CGSizeMake(ScreenWidth,ScreenWidth/5+20)
         }else if indexPath.section == 0 {
            return CGSizeMake(ScreenWidth, ScreenWidth/7*3)
        }
        return CGSizeMake((ScreenWidth-20)/2, (ScreenWidth-20)/2-10)
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section > 1 {
            return 2
        }
        return 1;
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return classArray.count+2
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        if section == 0 || section == 1 {
            return UIEdgeInsetsMake(0, 0, 0, 0)
        }
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section > 1{
            return CGSizeMake(ScreenWidth, 40)
        }
        return CGSizeMake(0, 0)
    }
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if indexPath.section > 1 {
            if kind.isEqual(UICollectionElementKindSectionHeader){
               let view = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "LabelReusableView", forIndexPath: indexPath) as! LabelReusableView
                let arr = titleArray[indexPath.section]
                view.releaseData(arr)
                return view
            }
        }
          let view = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "LabelReusableView", forIndexPath: indexPath) as! LabelReusableView
        
        return view
    }
}

//MARK: 滚动广告
extension DirectViewController:HomeHeaderDelegate {
    func homeHeaderRequestResult(homeRollData: DirectData) {
        /**
         *  进入下个VC
         */
        
        
    }

}