//
//  UserPageViewController.swift
//  MegaShop
//
//  Created by Eldor Makkambayev on 08.07.2018.
//  Copyright © 2018 Eldor Makkambayev. All rights reserved.
//

import UIKit

class UserPageViewController: UIViewController {

  @IBOutlet weak var userImage: UIImageView!
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var userCity: UILabel!
  @IBOutlet weak var userBalance: UILabel!
  
  var name: String!
  var city: String!
  var balance: String!
  var image: UIImage!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    print(name)
    userName.text = name
    userCity.text = city
    userBalance.text = balance
    userImage.image = image
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
