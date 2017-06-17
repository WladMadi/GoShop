//
//  AddNewProductViewController.swift
//  GoShop
//
//  Created by Влад Мади on 23.05.17.
//  Copyright © 2017 ВладМади. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class AddNewProductViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    


    
    var standartProductList: [String] = ["Молоко, литр", "Хлеб, шт", "Яблоки, кг"]
    
    var manager = ManagerData()
    
    var productList: [String] = []
    var meteringPicker: [String] = ["KG", "Count","Liter"]
    var productCount: [Double]  = [0.5, 1, 1.5, 2,2.5,3, 3.5,4,5,6,7]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        standartProductPickerView.dataSource = self
        standartProductPickerView.delegate = self
        productCountPickerView.dataSource = self
        productCountPickerView.delegate = self
        
        productList = manager.loadProductsListFromDB()
    }
    
    @IBAction func addNewProductButton(_ sender: Any) {
     
        if newProduct.text!.isEmpty && standartProductPickerView.accessibilityActivate(){
            let stdProductName = standartProductPickerView.selectedRow(inComponent: 0)
            print ("test")
        }

       else if newProduct.text!.isEmpty  {
            let alert = UIAlertController(title: "Error", message: "Product name is empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
            
        else if productList.contains(newProduct.text!) {
            let alert = UIAlertController(title: "Error", message: "Product is already", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        else {
            manager.writeToDB(newProductName: newProduct.text!)
            dismiss(animated: true, completion: nil)
            //performSegue(withIdentifier: "goHome", sender: nil)
        }
    }
    
    @IBOutlet weak var standartProductPickerView: UIPickerView!
    
    @IBOutlet weak var newProduct: UITextField!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    @IBOutlet weak var productCountPickerView: UIPickerView!
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
    return standartProductList.count
        }else {
            return productCount.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{

        if component == 0 {
                return standartProductList[row]
        }else {
            return String(productCount[row])
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "goHome" {
            let destVC: TableViewController2 = segue.destination as! TableViewController2
            destVC.productList.append(self.newProduct.text!)
            destVC.tableView.reloadData()
        }
    }
}
