//
//  managerData.swift
//  GoShop
//
//  Created by Влад Мади on 31.05.17.
//  Copyright © 2017 ВладМади. All rights reserved.
//

import Foundation
import RealmSwift

class ManagerData {
    
    
    func loadProductsListFromDB() -> [String] {
        
        var productList:[String] = []
    
        let realm = try! Realm()
        let data = realm.objects(ProductData)
        
        for value in data{
            productList.append(value.productName+",   "+String(value.productCount)+" "+value.productMetric)

        }
        return productList
    }
    

    
    func writeToDB(newProductName: String, newProductCount: Double, newProductMetric: String)  {
        let realm = try! Realm()
        let product = ProductData()
        product.productName = newProductName
        product.productCount = newProductCount
        product.productMetric = newProductMetric
        try! realm.write {
            realm.add(product,update: true)
        }
    }
}
