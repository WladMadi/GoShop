//
//  ArshiveTableViewController.swift
//  GoShop
//
//  Created by Влад Мади on 17.06.2017.
//  Copyright © 2017 ВладМади. All rights reserved.
//

import Foundation
import UIKit

class ArchiveTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("arhive")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
