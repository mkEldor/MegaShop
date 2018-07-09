//
//  ClothesCompanyTableViewCell.swift
//  MegaShop
//
//  Created by Eldor Makkambayev on 05.07.2018.
//  Copyright © 2018 Eldor Makkambayev. All rights reserved.
//

import UIKit

class ClothesCompanyTableViewCell: UITableViewCell {

  @IBOutlet weak var vieww: UIView!
  @IBOutlet weak var companyImage: UIImageView!
  override func awakeFromNib() {
    
    vieww.layer.masksToBounds = true
    vieww.layer.cornerRadius = 20
    
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
