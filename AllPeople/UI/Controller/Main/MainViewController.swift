//
//  MainViewController.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/20.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class MainViewController: CYLTabBarController {
    
    //StoryBoard名称
    let StoryName = ["Direct", "Column", "Play", "My"]
    
    //标题
    let Title = ["首页", "分类", "直播", "我的"]
    
    //选中照片
    let SelectImg = ["tabbar_home_sel", "tabbar_game_sel", "tabbar_room_sel", "tabbar_me_sel"]
    
    //未选中照片
    let Img = ["tabbar_home", "tabbar_game", "tabbar_room", "tabbar_me"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tabBarItemsAttributes: [AnyObject] = []
        var viewControllers: [AnyObject] = []
        
        for i in 0 ... Title.count - 1 {
            let dict = [CYLTabBarItemTitle:Title[i],
                 CYLTabBarItemImage:Img[i],
                 CYLTabBarItemSelectedImage:SelectImg[i]
            ]
            let vc = UIStoryboard(name: StoryName[i],bundle: nil).instantiateInitialViewController()!
            
            tabBarItemsAttributes.append(dict)
            viewControllers.append(vc)
        }
        
        self.tabBarItemsAttributes = tabBarItemsAttributes as! [[NSObject : AnyObject]]
        self.viewControllers = viewControllers as! [UIViewController]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
