
//
//  ClothsDetailViewController.swift
//  MegaShop
//
//  Created by Eldor Makkambayev on 07.07.2018.
//  Copyright © 2018 Eldor Makkambayev. All rights reserved.
//

import UIKit

class ClothsDetailViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
  
  
  @IBOutlet weak var clothTitle: UILabel!
  @IBOutlet weak var pageCollectionView: UICollectionView!
  @IBOutlet weak var clothName: UILabel!
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var choiseSize: UITextField!
  @IBOutlet weak var menuOutlet: UIButton!
  @IBOutlet weak var sizeTableView: UITableView!
  
  var cloth:Cloth?
  var clothImage: UIImage?
  var titlee :String?
  var name :String?
  var describe :String?
  var garmentSizeList = ["S", "L" , "X", "XL", "XXL"]
  var logoURL: String?
  
  var images:[UIImage?] = [UIImage(named: "clothImage"), #imageLiteral(resourceName: "filled"), #imageLiteral(resourceName: "half"), #imageLiteral(resourceName: "empty")]
  var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        didLoad()
      
    }
  

  
  func didLoad(){
    clothTitle.text = titlee
    clothName.text = name
    textView.text = describe
    navigationItem.title = titlee
    
    sizeTableView.isHidden = true
    pageCollectionView.delegate = self
    pageCollectionView.dataSource = self
    
    choiseSize.layer.borderColor = UIColor.gray.cgColor
    choiseSize.layer.borderWidth = 2
    choiseSize.layer.cornerRadius = 5
    choiseSize.clipsToBounds = true
  }
  
  @IBAction func menuAction(_ sender: Any) {
    if sizeTableView.isHidden{
    sizeTableView.isHidden = false
    }else{
      sizeTableView.isHidden = true
      
    }
  }
}

extension ClothsDetailViewController{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return garmentSizeList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "sizeCell", for: indexPath)
    cell.textLabel?.text = garmentSizeList[indexPath.row]
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath)
    choiseSize.text = "   \((cell?.textLabel?.text!)!)"
    sizeTableView.isHidden = true
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pageCell", for: indexPath) as! PageCVCell
    cell.pageImageView.load(fromUrl: logoURL!, complation: nil)
    
    
    
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: pageCollectionView.frame.width, height: pageCollectionView.frame.height)
  }

}
