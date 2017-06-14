//
//  ProductData.swift
//  GoShop
//
//  Created by Влад Мади on 31.05.17.
//  Copyright © 2017 ВладМади. All rights reserved.
//

import Foundation
import RealmSwift

class ProductData: Object {
    dynamic var productName: String = ""
    dynamic var produstCount: Double = 0
    override static func primaryKey() -> String? {
        return "productName"
    }
}
