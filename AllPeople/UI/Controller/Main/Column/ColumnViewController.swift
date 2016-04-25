//
//  ColumnViewController.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/20.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class ColumnViewController: UIViewController {
    
    var collectionViewOld: UICollectionView?
    var columnArray = [ColumnMode]()
    let directRequest = RequestDataColumn()
    var flowLayoutOld = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func reloadCollectionView() {
        
        flowLayoutOld = UICollectionViewFlowLayout()
        collectionViewOld = UICollectionView(frame:view.bounds, collectionViewLayout: flowLayoutOld)
        collectionViewOld?.delegate = self
        collectionViewOld?.dataSource = self
        view.addSubview(collectionViewOld!)
        collectionViewOld?.backgroundColor = BgColor
        collectionViewOld!.registerClass(ColumnCell.self, forCellWithReuseIdentifier: "ColumnCell")
        directRequest.delegate = self
        directRequest.requestData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ColumnViewController:RequestDataColumnDelegate {
    
    func request(directAll: NSArray) {
        
        columnArray = directAll as! [ColumnMode]
        collectionViewOld?.reloadData()
    }
}

extension ColumnViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return columnArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ColumnCell", forIndexPath: indexPath) as! ColumnCell
        cell.backgroundColor = BgColor
        cell.releaseData(columnArray[indexPath.row])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((ScreenWidth-20)/3, (ScreenWidth-20)/9*4+30)
    }
   
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
  
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
}
