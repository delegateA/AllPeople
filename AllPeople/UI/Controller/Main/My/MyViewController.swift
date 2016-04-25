//
//  MyViewController.swift
//  AllPeople
//
//  Created by zzh_iPhone on 16/4/20.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    
    
    
    @IBOutlet weak var name: UITextField!
     @IBOutlet weak var pw: UITextField!
    var login: NSString?
    var pwd:   NSString?
    @IBAction func login(sender: AnyObject) {
        login = name.text
        pwd = pw.text
        NSUserDefaults .standardUserDefaults(setValue(login, forKey: "LoginAccount"))
        NSUserDefaults.standardUserDefaults(setValue(pwd, forKey: "LoginPw"))
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

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
