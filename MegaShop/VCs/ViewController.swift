//
//  ViewController.swift
//  MegaShop
//
//  Created by Eldor Makkambayev on 04.07.2018.
//  Copyright © 2018 Eldor Makkambayev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
  

  @IBOutlet weak var balanceTF: UITextField!
  @IBOutlet weak var usernameTF: UITextField!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var pickerView: UIPickerView!
  @IBOutlet weak var blurredView: UIVisualEffectView!
  @IBAction func chnagePhotoAction(_ sender: Any) {
    let image = UIImagePickerController()
    image.delegate = self
    image.sourceType = UIImagePickerControllerSourceType.photoLibrary
    image.allowsEditing = false
    self.present(image, animated: true)
  }
  @IBOutlet weak var cityTF: UITextField!

  
  var city: String?
  var username: String?
  var balance: String?
  var userImage: UIImage?
  
  var cityList = ["Astana", "Almaty", "Shymkent", "Aktau", "Aktobe", "Atyrau", "Zhezgazgan", "Karaganda", "Kostanay", "Pavlodar", "Petropavlsk", "Semey", "Turkestan", "Uskemen", ]
  
  @IBAction func signInAction(_ sender: UIButton) {
  }

  @IBAction func choiseCityAction(_ sender: Any) {
    UIView.animate(withDuration: 0.3) {
      self.blurredView.alpha = 1
    }

  }
  @IBAction func okAction(_ sender: Any) {
    UIView.animate(withDuration: 0.3) {
      self.blurredView.alpha = 0
    }
  }
}



extension ViewController{
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    imageView.layer.masksToBounds = true
    imageView.layer.cornerRadius = 65
    
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return cityList[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return cityList.count
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    cityTF.text = cityList[row]
    
  }
  
  


}

