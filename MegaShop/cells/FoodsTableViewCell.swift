//
//  FoodsTableViewCell.swift
//  MegaShop
//
//  Created by Eldor Makkambayev on 05.07.2018.
//  Copyright © 2018 Eldor Makkambayev. All rights reserved.
//

import UIKit

class FoodsTableViewCell: UITableViewCell {
  var quantity = 0

  @IBOutlet weak var foodImage: UIImageView!
  @IBOutlet weak var foodName: UILabel!
  @IBOutlet weak var foodPrice: UILabel!
  @IBOutlet weak var quantityView: UIView!
  @IBOutlet weak var quantityLabel: UILabel!
  
  @IBAction func quantityAction(_ sender: UIButton) {
    if sender.tag == 0{
      quantity -= 1
    }else{
      quantity += 1
    }
    quantityLabel.text = String(quantity)

  }
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    foodImage.layer.masksToBounds = true
    foodImage.layer.cornerRadius = 45
    quantityView.layer.cornerRadius = 12.5
    quantityView.layer.masksToBounds = true
    quantityView.layer.borderColor = UIColor.black.cgColor
    quantityView.layer.borderWidth = 1
    quantityView.clipsToBounds = true
    
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
