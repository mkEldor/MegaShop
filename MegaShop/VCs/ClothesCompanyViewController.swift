//
//  ClothesCompanyViewController.swift
//  MegaShop
//
//  Created by Eldor Makkambayev on 05.07.2018.
//  Copyright © 2018 Eldor Makkambayev. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ClothesCompanyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  var clothesCompanyArrray = [ClothCompany]()
  
  @IBOutlet weak var tableView: UITableView!
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return clothesCompanyArrray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "clothesCompany_cell", for: indexPath) as! ClothesCompanyTableViewCell
    let clothCompany = clothesCompanyArrray[indexPath.row]
    if let imageUrl = clothCompany.logoUrl {
      cell.companyImage?.load(fromUrl: imageUrl, complation: nil)
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let stroryboard = UIStoryboard(name: "Main", bundle: nil)
    let dvc = stroryboard.instantiateViewController(withIdentifier: "clothsID") as! ClothViewController
    let clothCompany = clothesCompanyArrray[indexPath.row]
    dvc.id = clothCompany.id!
    dvc.titlee = clothCompany.name!
    dvc.describe = clothCompany.description!
    
    self.navigationController?.pushViewController(dvc, animated: true)
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
  }
  
  
  
  private func loadData() {
    Alamofire.request("https://megaapi.herokuapp.com/api/cloth").responseJSON { response in
      let result = response.result
      if let dict = result.value as? Dictionary<String,AnyObject>{
        if let dataList = dict["data"] as? [AnyObject] {
          for data in dataList {
            self.clothesCompanyArrray.append(self.from(data: data))
          }
          self.tableView.reloadData()
        }
      }
    }
  }
  
  private func from(data: AnyObject) -> ClothCompany {
    let clothCompany: ClothCompany = ClothCompany()
    clothCompany.id = data["id"] as? Int
    clothCompany.name = data["name"] as? String
    clothCompany.description = data["description"] as? String
    clothCompany.logoUrl = data["logoUrl"] as? String
    return clothCompany
  }
  
}
