//
//  BEOOrderListController.swift
//  BusEasyOrder
//  菜单列表
//  Created by 冯万琦 on 2017/1/4.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit

class MenuListController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    let menuCellID = "MenuListCell"
    let typeCellID = "TypeListCell"

    var menuDataArray: Array<Any>!
    var typeDataArray: Array<Any>!

    //手势平移
    var beganX: CGFloat = 0.0
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var typeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func setUpData() {
        menuDataArray = ["", "", "", "", "", "", "", ""]
        typeDataArray = ["热菜", "凉菜", "酒水"]
    }
    override func setUpView() {
        //注册cell
        let nib: UINib? = UINib.init(nibName: menuCellID, bundle: nil)
        self.menuTableView.register(nib, forCellReuseIdentifier: menuCellID)
        
        self.typeTableView.register(UITableViewCell.self, forCellReuseIdentifier: typeCellID)
        
        //添加滑动手势
        let recognizer = UIPanGestureRecognizer.init(target: self, action: #selector(MenuListController.pan(_:)))
        self.view.addGestureRecognizer(recognizer)
    }
    
    func pan(_ recognizer: UIPanGestureRecognizer) {
        let x = recognizer.translation(in: self.view).x
        
        
        if recognizer.state == UIGestureRecognizerState.began {
            beganX = x
        }
        let disdance = Int(x - beganX)
        print("distance:\(disdance)")
        print("typeTableView.frame.minX:\(typeTableView.frame.minX)")
        print("typeTableView.bounds.size.width:\(typeTableView.bounds.size.width)")
//        typeTableView.transform = CGAffineTransform.init(translationX: disdance, y: 0)
//        menuTableView.transform = CGAffineTransform.init(translationX: disdance, y: 0)
        //改变约束
        let realX = Int(typeTableView.frame.minX) + disdance
        if realX >= -Int(typeTableView.bounds.width) && realX <= 0{
            updateLocationConstant(typeTableView, typeTableView.frame.minX + CGFloat(disdance), NSLayoutAttribute.leading)
        }else {
            
        }
        
        //松开时
        if recognizer.state == UIGestureRecognizerState.ended {
            if Int(typeTableView.frame.minX) >= -Int(typeTableView.bounds.width) / 2  {
                //展出
                self.updateLocationConstant(self.typeTableView, 0, NSLayoutAttribute.leading)
                UIView.animate(withDuration: 1, animations: {
                    
                })
                
            }else {
                //收入
                UIView.animate(withDuration: 0.5, animations: {
                    self.updateLocationConstant(self.typeTableView, -self.typeTableView.frame.width, NSLayoutAttribute.leading)
                })
                
            }
        }
        //distance >0 向右移动， distance < 0 向左移动
//        if abs(disdance) >= 1 && typeTableView.frame.minX <= 0 &&  abs(Int(typeTableView.frame.minX)) <= Int(typeTableView.bounds.size.width){
//            updateLocationConstant(typeTableView, CGFloat(disdance), NSLayoutAttribute.leading)
//        }
//        if x < 0 && fabsf(Float(typeTableView.frame.minX)) <= Float(typeTableView.bounds.size.width) {
//            updateLocationConstant(typeTableView, disdance, NSLayoutAttribute.leading)
//        }else if x > 0 && typeTableView.frame.minX <= 0{
//            updateLocationConstant(typeTableView, disdance, NSLayoutAttribute.leading)
//        }
        
        beganX = x
    }
    
    //改变约束
    func updateLocationConstant(_ view: UIView, _ scale: CGFloat, _ attribute: NSLayoutAttribute) {
        for constraint in view.superview!.constraints {
            if (constraint.firstItem as! NSObject == view && constraint.firstAttribute == attribute) {
                constraint.constant = scale
                
            }
        }
        typeTableView.layoutIfNeeded()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if tableView == self.menuTableView {
            return menuDataArray.count
        }else if tableView == self.typeTableView{
            return 1
        }
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableView == self.menuTableView {
            return 1
        }else if tableView == self.typeTableView{
            return typeDataArray.count
        }
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if tableView == self.menuTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: menuCellID) as! MenuListCell
            
        }else if tableView == self.typeTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: typeCellID, for: indexPath)
            cell.textLabel?.text = typeDataArray[indexPath.row] as? String
        }else {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: typeCellID)
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.menuTableView {
            return 90.0
        }else if tableView == self.typeTableView{
            return 44.0
        }
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kMainBoundsWidth, height: 1))
        view.backgroundColor = UIColor.clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kMainBoundsWidth, height: 10))
        view.backgroundColor = kgray
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }

    /*
    // to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // to support rearranging the table view.
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // to support conditional rearranging of the table view.
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
