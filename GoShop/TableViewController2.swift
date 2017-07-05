//
//  TableViewController2.swift
//  GoShop
//
//  Created by Влад Мади on 23.05.17.
//  Copyright © 2017 ВладМади. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift


class TableViewController2: UITableViewController {
    
    var productList: [String] = []
    var countProductList: [Double] = []
    let realm = try! Realm()
    var manager = ManagerData()
    var notificationToken: NotificationToken? = nil
    
    @IBAction func addProduct(_ sender: Any) {
        performSegue(withIdentifier: "addProduct", sender: nil)
    }
    @IBAction func arhiveButton(_ sender: Any) {
        
        performSegue(withIdentifier: "arhiveProducts", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productList = manager.loadProductsListFromDB()

        print(Realm.Configuration.defaultConfiguration.fileURL!, "dsds \(productList)")
        
        notificationToken = realm.addNotificationBlock {notification, realm in
            self.productList = self.manager.loadProductsListFromDB()
            print ("ReadDB \(self.productList)")
        self.tableView.reloadData()
        }
    }

//    override func viewWillAppear(_ animated: Bool) {
//        productList = manager.loadProductsListFromDB()
//        print ("ok2")
//        
//        tableView.reloadData()
//    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ok \(indexPath.row)")
        productList.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    @IBAction func gestureReght(_ sender: Any) {
        print("ok")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    

    
    deinit {
        notificationToken?.stop()
    }
    
    
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let swipeCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BWSwipeRevealCell
//        
//        swipeCell.bgViewLeftImage = UIImage(named:"Done")!.withRenderingMode(.alwaysTemplate)
//        swipeCell.bgViewLeftColor = UIColor.green
//        
//        swipeCell.bgViewRightImage = UIImage(named:"Delete")!.withRenderingMode(.alwaysTemplate)
//        swipeCell.bgViewRightColor = UIColor.red
//        
//        swipeCell.type = .springRelease
//        
//        swipeCell.delegate = self // Or whatever your delegate might be
//        return swipeCell
//    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        self.configureCell(cell, atIndexPath: indexPath)
          cell.textLabel!.text = productList[indexPath.row]
        return cell
    }
    
//    func configureCell(_ cell: UITableViewCell, atIndexPath indexPath: IndexPath) {
//        let swipeCell:BWSwipeRevealCell = cell as! BWSwipeRevealCell
//        
//        swipeCell.bgViewLeftImage = UIImage(named:"Done")!.withRenderingMode(.alwaysTemplate)
//        swipeCell.bgViewLeftColor = UIColor.green
//        
//        swipeCell.bgViewRightImage = UIImage(named:"Delete")!.withRenderingMode(.alwaysTemplate)
//        swipeCell.bgViewRightColor = UIColor.red
//        
//        swipeCell.textLabel!.text = productList[indexPath.row]
////        let type = BWSwipeCellType(rawValue: object.value(forKey: "type") as! Int)!
////        swipeCell.type = type
////        
////        switch type {
////        case .swipeThrough:
////            swipeCell.textLabel!.text = "Swipe Through"
////            break
////        case .springRelease:
////            swipeCell.textLabel!.text = "Spring Release"
////            break
////        case .slidingDoor:
////            swipeCell.textLabel!.text = "Sliding Door"
////            break
////        }
//        
//        swipeCell.delegate = self
//    }
}
