//
//  FoodComponyVCViewController.swift
//  MegaShop
//
//  Created by Eldor Makkambayev on 04.07.2018.
//  Copyright © 2018 Eldor Makkambayev. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class FoodComponyVCViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var foodsCompanyArray = [FoodCompany]()
  
  
  @IBOutlet weak var tableView: UITableView!
  private let URL_REQEST = "https://megaapi.herokuapp.com/api/food"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
  }
  
  private func loadData() {
    Alamofire.request(URL_REQEST).responseJSON { response in
      let result = response.result
      if let dict = result.value as? Dictionary<String,AnyObject>{
        if let dataList = dict["data"] as? [AnyObject] {
          for data in dataList {
            self.foodsCompanyArray.append(self.from(data: data))
          }
          self.tableView.reloadData()
        }
      }
    }
  }
  
  private func from(data: AnyObject) -> FoodCompany {
    let foodCompany: FoodCompany = FoodCompany()
    foodCompany.id = data["id"] as? Int
    foodCompany.name = data["name"] as? String
    foodCompany.description = data["description"] as? String
    foodCompany.logoUrl = data["logoUrl"] as? String
    foodCompany.header = data["header"] as? String
    foodCompany.averageRating = data["averageRating"] as? Int
    foodCompany.averageCheck = data["averageCheck"] as? Int
    return foodCompany
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return foodsCompanyArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "foodCompany_cell", for: indexPath) as! FoodsCompanyTableViewCell
    
    let foodCompany = foodsCompanyArray[indexPath.row]
    
    cell.companyName.text = foodCompany.name
    cell.companyDescription.text = foodCompany.description
    cell.averageCheck.text = "  Средний чек: \(foodCompany.averageCheck!)  "
    cell.averageRating.text = " \(foodCompany.averageRating!) "
    
    if let imageUrl = foodCompany.logoUrl {
      cell.companyImage.load(fromUrl: imageUrl, complation: nil)
    }
    
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let stroryboard = UIStoryboard(name: "Main", bundle: nil)
    let dvc = stroryboard.instantiateViewController(withIdentifier: "foodsID") as! FoodsViewController
    
    let foodCompany = foodsCompanyArray[indexPath.row]
      
    dvc.id = foodCompany.id!
    dvc.titlee = foodCompany.name
    dvc.header = foodCompany.header
    
    navigationController?.pushViewController(dvc, animated: true)
  }
  
  
}







