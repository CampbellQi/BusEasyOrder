//
//  BaseViewController.swift
//  EOrder
//
//  Created by 冯万琦 on 2017/1/4.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpData()
        self.setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpData() {
    }
    func setUpView() {
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
