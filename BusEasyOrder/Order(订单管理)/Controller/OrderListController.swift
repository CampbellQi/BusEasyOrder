//
//  OrderListController.swift
//  BusEasyOrder
//
//  Created by 冯万琦 on 2017/1/6.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit

class OrderListController: BaseListController {
    let orderCellID = "OrderListCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setUpView() {
        let nib = UINib.init(nibName: orderCellID, bundle: Bundle.main)
        self.tableView.register(nib, forCellReuseIdentifier: orderCellID)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OrderListCell = tableView.dequeueReusableCell(withIdentifier: orderCellID, for: indexPath) as! OrderListCell
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
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
