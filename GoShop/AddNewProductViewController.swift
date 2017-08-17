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
    

    @IBOutlet weak var ProductMetricPicker: UISegmentedControl!

    var pickerViewChange: Bool = false
    
    var standartProductList: [String] = ["Молоко, литр", "Хлеб, шт", "Яблоки, кг"]
    var standartProductCount: [Double] = [0.5, 1, 1.5, 2, 2.5, 3]
    
    var createProduct: ProductData = ProductData()
    
    var manager = ManagerData()
    
    @IBOutlet weak var standartProductPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        standartProductPickerView.dataSource = self
        standartProductPickerView.delegate = self
        manager.loadProductsDataFromDB()
    }
    
    @IBAction func addNewProductButton(_ sender: Any) {
     
        if newProduct.text!.isEmpty && pickerViewChange{
            
            let metricTitle: String = ProductMetricPicker.titleForSegment(at: ProductMetricPicker.selectedSegmentIndex)!
            createProduct.productName = standartProductList[standartProductPickerView.selectedRow(inComponent: 0)]
            createProduct.productCount = Double(standartProductCount[standartProductPickerView.selectedRow(inComponent: 1)])
            createProduct.productMetric = metricTitle
            print(createProduct.productName, createProduct.productCount, createProduct.productMetric)
            manager.writeToDB(newProduct: createProduct)
        }

       else if newProduct.text!.isEmpty  {
            let alert = UIAlertController(title: "Error", message: "Product name is empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
            
        else if manager.findProductInDB(productName: newProduct.text!) {
            let alert = UIAlertController(title: "Error", message: "Product is already", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        else {
            let metricTitle: String = ProductMetricPicker.titleForSegment(at: ProductMetricPicker.selectedSegmentIndex)!
            
            createProduct.productName = newProduct.text!
            createProduct.productCount = Double(productCountTextField.text!)!
            createProduct.productMetric = metricTitle
            
            manager.writeToDB(newProduct: createProduct)
//            dismiss(animated: true, completion: nil)
            //performSegue(withIdentifier: "goHome", sender: nil)
        }
    }
    

    
    @IBOutlet weak var newProduct: UITextField!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    @IBOutlet weak var productCountTextField: UITextField!
    
    
    @IBOutlet weak var productCountPickerView: UIPickerView!
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerViewChange = true
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
    return standartProductList.count
        }else {
            return standartProductCount.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{

        if component == 0 {
                return standartProductList[row]
        }else {
            return String(standartProductCount[row])
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         if segue.identifier == "goHome" {
//            let destVC: TableViewController2 = segue.destination as! TableViewController2
//            destVC.productList.append(self.newProduct.text!)
//            destVC.tableView.reloadData()
//        }
    }
}
