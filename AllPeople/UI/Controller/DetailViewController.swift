//
//  DetailViewController.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/25.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit
import AVFoundation
class DetailViewController: UIViewController {
    var vid:String!
    var maTransform :CATransform3D?
    var player: AVPlayer!
    var playerItem: AVPlayerItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playVideo()
        // Do any additional setup after loading the view.
    }
    
    func playVideo() {
   
        let url = String.init(format: "http://hls.quanmin.tv/live/%@/playlist.m3u8", vid)
        let UTF8Str = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        let videoUrl:NSURL = NSURL.init(string: UTF8Str!)!
        
        playerItem = AVPlayerItem.init(URL: videoUrl)
        player = AVPlayer.init(playerItem: playerItem)
        let playerLayout = AVPlayerLayer.init(player: player)
        playerLayout.frame = CGRectMake(0, 100, ScreenWidth, ScreenHeight*9/16)
        view.layer.addSublayer(playerLayout)
        player.play()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
