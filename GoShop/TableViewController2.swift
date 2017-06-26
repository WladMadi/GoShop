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
    
    @IBAction func arhiveButton(_ sender: Any) {
        
        performSegue(withIdentifier: "arhiveButton", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.productList = self.manager.loadProductsListFromDB()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        notificationToken = realm.addNotificationBlock {notification, realm in
            self.productList = self.manager.loadProductsListFromDB()
            print ("ReadDB")
        self.tableView.reloadData()
        }
    }

    //override func viewWillAppear(_ animated: Bool) {
      //  productList = manager.loadProductsListFromDB()
        //print ("ok2")
        
       // tableView.reloadData()
   // }
    
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = productList[indexPath.row]
      //cell.detailTextLabel?.text =
        return cell
    }
    


}
