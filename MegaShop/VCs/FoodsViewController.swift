//
//  FoodsViewController.swift
//  MegaShop
//
//  Created by Eldor Makkambayev on 05.07.2018.
//  Copyright © 2018 Eldor Makkambayev. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class FoodsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var companyImage: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var averageCheck: UILabel!
  @IBOutlet weak var averageRating: UILabel!
  
  
  let starRatingView = SwiftyStarRatingView()
  var rating: Int? = 0
  var check: Int? = 0
  var foodsArray = [AnyObject]()
  var header: String?
//  private let companyImageArray: [UIImage] = [#imageLiteral(resourceName: "KFC_SG_RGB_2000"), #imageLiteral(resourceName: "burger_king"), #imageLiteral(resourceName: "starbucks"), #imageLiteral(resourceName: "PizzaHut-logo"), #imageLiteral(resourceName: "taco_bell"), #imageLiteral(resourceName: "mc_donalds"), #imageLiteral(resourceName: "doner_kebab"), #imageLiteral(resourceName: "doner_kebab") ]
  var starRating: CGFloat? = 0
  
  
  
  var idURL = "https://megaapi.herokuapp.com/api/food/id/"
  var id: Int = 0
  var titlee: String? = ""
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return foodsArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "foods_cell", for: indexPath) as! FoodsTableViewCell
    
    let foodName = foodsArray[indexPath.row]["name"]
    let foodPrice = foodsArray[indexPath.row]["price"]
    let price = foodPrice as? Int
    cell.foodName.text = foodName as? String
    cell.foodPrice.text = String(price!) + "тг."
    if let imageURL = foodsArray[indexPath.row]["logoUrl"] as? String{
      Alamofire.request(imageURL).responseImage { (response) in
        if let image = response.result.value{
          let size  = CGSize(width: 80, height: 110)
          let scaledImage = image.af_imageScaled(to: size)
          DispatchQueue.main.async {
            cell.foodImage.image = scaledImage
            
          }
          
        }
      }
    }
    return cell
    
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.averageCheck.layer.masksToBounds = true
    self.averageCheck.layer.cornerRadius = 7
    self.averageRating.layer.masksToBounds = true
    self.averageRating.layer.cornerRadius = 7
    
    self.navigationItem.title = titlee
//    self.companyImage.image = companyImageArray[id]
    self.averageRating.text = " " + String(check!) + " "
    self.averageCheck.text = "   Средний чек: " + String(rating!) + "   "
    
    star()
    load()
    loadCompanyImage()
    
    
    
    // Do any additional setup after loading the view.
  }
  
  
  func load(){
    Alamofire.request(idURL + String(id)).responseJSON { response in
      let result = response.result
      if let dict = result.value as? Dictionary<String,AnyObject>{
        if let innerDict = dict["data"]{
          self.foodsArray = innerDict as! [AnyObject]
          self.tableView.reloadData()
          
          
        }
        
      }
    }
  }
  
  func loadCompanyImage(){
    if let imageURL = header{
      Alamofire.request(imageURL).responseImage { (response) in
        if let image = response.result.value{
          let size  = CGSize(width: 375, height: 109)
          let scaledImage = image.af_imageScaled(to: size)
          DispatchQueue.main.async {
            self.companyImage.image = scaledImage
            
          }
          
        }
      }
    }
  }
  
  
  
  
  func star(){
    starRatingView.frame = CGRect(x: 255 , y: 187, width: 80, height: 20)
    
    starRatingView.maximumValue = 5         //default is 5
    starRatingView.minimumValue = 0         //default is 0
    starRatingView.value = starRating!                //default is 0
    
    starRatingView.tintColor = UIColor.yellow
    
    
    self.view.addSubview(starRatingView)
    starRatingView.allowsHalfStars = true   //default is true
    starRatingView.value = starRating!
    
    starRatingView.accurateHalfStars = true
    
    starRatingView.continuous = true
    
    starRatingView.halfStarImage = UIImage(named: "half.png")
    starRatingView.emptyStarImage = UIImage(named: "empty.png")
    starRatingView.filledStarImage = UIImage(named: "filled.png")
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
