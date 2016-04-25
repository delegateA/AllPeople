//
//  PlayViewController.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/20.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    var collectionViewOld: UICollectionView?
    var playArray = [PlayModel]()
    let directRequest = RequestPlayData()
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
        collectionViewOld!.registerClass(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        directRequest.delegate = self
        directRequest.requestData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PlayViewController:RequestPlayDataDelegate {
    
    func request(directAll: NSArray) {
        
        playArray = directAll as! [PlayModel]
        collectionViewOld?.reloadData()
    }
}

extension PlayViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
        cell.backgroundColor = BgColor
        cell.releasePlayData(playArray[indexPath.row])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((ScreenWidth-15)/2, (ScreenWidth-15)/2-10)
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
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var data = PlayModel()
        data = playArray[indexPath.row]
        let nextVC = DetailViewController()
        print(data.uid)
        nextVC.vid = data.uid
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

