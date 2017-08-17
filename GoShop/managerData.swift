//
//  managerData.swift
//  GoShop
//
//  Created by Влад Мади on 31.05.17.
//  Copyright © 2017 ВладМади. All rights reserved.
//

import Foundation
import RealmSwift


var productList: [ProductData] = []

class ManagerData {
    
    
  //  func loadProductsListFromDB() -> [ProductData] {
        
  //      var productList:[ProductData] = []
    
  //      let realm = try! Realm()
  //      let data = realm.objects(ProductData)
        
  //      for value in data{
  //          productList.append(value)
//                +",   "+String(value.productCount)+" "+value.productMetric)

  //      }
   //     return productList
   // }
    
    
    
    func loadProductsDataFromDB()  {
        
      ///  var productList:[String] = []
        
        let realm = try! Realm()
        //var productListLocal = realm.objects(ProductData)
        let data = realm.objects(ProductData)
        
     for value in data{
            productList.append(value)
      }
    }

    
    func writeToDB(newProduct: ProductData)  {
        let realm = try! Realm()
 
        try! realm.write {
            realm.add(newProduct,update: true)
        }
    }
    
    func findProductInDB(productName: String) -> Bool  {
    
    ///  var productList:[String] = []
    
    let realm = try! Realm()
    //var productListLocal = realm.objects(ProductData)
    let data = realm.objects(ProductData)
    
    for value in data{
    if value.productName == productName{
        return true
        }
    }
        return false
    }
}
