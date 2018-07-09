//
//  ClothViewController.swift
//  MegaShop
//
//  Created by Eldor Makkambayev on 06.07.2018.
//  Copyright © 2018 Eldor Makkambayev. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class ClothViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var noSubjectsView: UIView!
  
  var id: Int = 0
  var titlee: String = ""
  var describe: String = ""
  var array = [AnyObject]()
  var dvcImage: UIImage?
  var clothsArray = [Cloth]()
  var garmentArray = [AnyObject]()
  var shoesArray = [AnyObject]()
  
  
  
  var idURL = "https://megaapi.herokuapp.com/api/cloth/id/"
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return array.count
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cloths_cell", for: indexPath) as! ClothsCollectionViewCell
    
    
    let cloth = clothsArray[indexPath.row]
    
    cell.clothName.text = cloth.name
    cell.clothPrice.text = String(cloth.price!)
    cell.clothImage.load(fromUrl: cloth.logoUrl!, complation: nil)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let stroryboard = UIStoryboard(name: "Main", bundle: nil)
    let dvc = stroryboard.instantiateViewController(withIdentifier: "oneCloth") as! ClothsDetailViewController
    let cloth = clothsArray[indexPath.row]
    dvc.title = cloth.name
    dvc.clothImage = dvcImage
    dvc.titlee = titlee
    dvc.name = cloth.name
    dvc.describe = describe
    navigationController?.pushViewController(dvc, animated: true)

  }

    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.navigationItem.title = titlee
      
      loadData()
    }
  
  @IBAction func segmentedAction(_ sender: UISegmentedControl) {
    if sender.selectedSegmentIndex == 0{
      sort()
      array = clothsArray
      if array.count == 0{
        noSubjectsView.alpha = 1
      }
    }
    else if sender.selectedSegmentIndex == 1{
      sort()
      array = garmentArray
      if array.count == 0{
        noSubjectsView.alpha = 1
      }
    }
    else if sender.selectedSegmentIndex == 2{
      sort()
      array = shoesArray
      if array.count == 0{
        noSubjectsView.alpha = 1
      }
    }
  }
  
  func loadData(){
    Alamofire.request(idURL + String(id)).responseJSON { response in
      let result = response.result
      if let dict = result.value as? Dictionary<String,AnyObject>{
        if let innerDict = dict["data"] as? [AnyObject]{
          for data in innerDict {
            self.clothsArray.append(self.from(data: data))
          }
          self.array = self.clothsArray
          self.collectionView.reloadData()
        }
      }
    }
  }
  
  private func from(data: AnyObject) -> Cloth {
    let cloths: Cloth = Cloth()
    cloths.name = data["name"] as? String
    cloths.price = data["price"] as? Int
    cloths.logoUrl = data["logoUrl"] as? String
    cloths.type = data["type"] as? String
    return cloths
  }
  
  func sort(){
    noSubjectsView.alpha = 0
    garmentArray.removeAll()
    shoesArray.removeAll()
    
    for index in 0 ... self.clothsArray.count - 1{
      if self.clothsArray[index].type  == "garment"{
        self.garmentArray.append(self.clothsArray[index])
      }else if self.clothsArray[index].type == "shoes"{
        self.shoesArray.append(self.clothsArray[index])
      }
      
      
    }
    collectionView.reloadData()
    
  }
  
  
  
  
  
}
