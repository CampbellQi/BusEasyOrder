//
//  LoginController.swift
//  BusEasyOrder
//  登录
//  Created by 冯万琦 on 2017/1/6.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit

class LoginController: BaseViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func setUpView() {
        logoImageView.layer.masksToBounds = true
        logoImageView.layer.cornerRadius = logoImageView.bounds.size.width * 0.5
    }
    @IBAction func loginClicked(_ sender: Any) {
        let appdelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.showMenuSB()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
