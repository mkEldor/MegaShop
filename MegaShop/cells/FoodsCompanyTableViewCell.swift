//
//  FoodsCompanyTableViewCell.swift
//  MegaShop
//
//  Created by Eldor Makkambayev on 04.07.2018.
//  Copyright © 2018 Eldor Makkambayev. All rights reserved.
//

import UIKit

class FoodsCompanyTableViewCell: UITableViewCell {

  @IBOutlet weak var companyImage: UIImageView!
  @IBOutlet weak var companyName: UILabel!
  @IBOutlet weak var companyDescription: UILabel!
  @IBOutlet weak var averageCheck: UILabel!
  @IBOutlet weak var averageRating: UILabel!
  
  
  
  let starRatingView = SwiftyStarRatingView()
  
  
  
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
//
//    averageCheck.clipsToBounds = true
    averageCheck.layer.masksToBounds = true
    averageCheck.layer.cornerRadius = 6
    
//    averageCheck.clipsToBounds = true
    averageRating.layer.masksToBounds = true
    averageRating.layer.cornerRadius = 6
    
    starRatingView.frame = CGRect(x: 245 , y: 12, width: 80, height: 20)
    
    starRatingView.maximumValue = 5         //default is 5
    starRatingView.minimumValue = 0         //default is 0
    starRatingView.value = 3                //default is 0
    
    starRatingView.tintColor = UIColor.yellow
    
//    starRatingView.addTarget(self, action: #selector(function), for: .valueChanged)
    
    
    self.addSubview(starRatingView)
    starRatingView.allowsHalfStars = true   //default is true
    starRatingView.value = 1.5
    
    starRatingView.accurateHalfStars = true
    
    starRatingView.continuous = true
    
    starRatingView.halfStarImage = UIImage(named: "half.png")
    starRatingView.emptyStarImage = UIImage(named: "empty.png")
    starRatingView.filledStarImage = UIImage(named: "filled.png")
  }
  
  
  
  
  
  
  
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
