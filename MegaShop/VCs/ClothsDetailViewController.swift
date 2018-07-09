
//
//  ClothsDetailViewController.swift
//  MegaShop
//
//  Created by Eldor Makkambayev on 07.07.2018.
//  Copyright © 2018 Eldor Makkambayev. All rights reserved.
//

import UIKit

class ClothsDetailViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
 
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var clothTitle: UILabel!
  @IBOutlet weak var clothName: UILabel!
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var choiseSize: UITextField!
  @IBOutlet weak var menuOutlet: UIButton!
  @IBOutlet weak var sizeTableView: UITableView!
  
  var clothImage: UIImage?
  var titlee :String?
  var name :String?
  var describe :String?
  var garmentSizeList = ["S", "L" , "X", "XL", "XXL"]
  
  var images:[UIImage?] = [UIImage(named: "clothImage"), #imageLiteral(resourceName: "filled"), #imageLiteral(resourceName: "half"), #imageLiteral(resourceName: "empty")]
  var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        didLoad()
        carusel()
      sizeTableView.isHidden = true
    }

  
  
  
  
  
  func carusel(){
    pageControl.numberOfPages = images.count
    for index in 0..<images.count{
      frame.origin.x = scrollView.frame.size.width * CGFloat(index)
      frame.size = scrollView.frame.size
      
      let imgView = UIImageView(frame: frame)
      imgView.image = UIImageView(image: images[index]).image
      self.scrollView.addSubview(imgView)
    }
    
    scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(images.count), height: scrollView.frame.size.height)
    scrollView.delegate = self
  }
  
  func didLoad(){
    clothTitle.text = titlee
    clothName.text = name
    textView.text = describe
    navigationItem.title = titlee
    
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
  
  
  
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
    pageControl.currentPage = Int(pageNumber)
  }
 

  @IBAction func rightSwipeAction(_ sender: UISwipeGestureRecognizer) {
    let x = CGFloat(pageControl.currentPage+1) * scrollView.frame.size.width
    scrollView.contentOffset = CGPoint(x: x, y: 0)
    pageControl.currentPage += 1
    if pageControl.currentPage == 2{
    }
  }
  
  @IBAction func rightImage(_ sender: Any) {
    let x = CGFloat(pageControl.currentPage+1) * scrollView.frame.size.width
    scrollView.contentOffset = CGPoint(x: x, y: 0)
    pageControl.currentPage += 1
    if pageControl.currentPage == 2{
    }
  }
  
  @IBAction func leftSwipeImage(_ sender: UISwipeGestureRecognizer) {
    let x = CGFloat(pageControl.currentPage-1) * scrollView.frame.size.width
    scrollView.contentOffset = CGPoint(x: x, y: 0)
    pageControl.currentPage -= 1
    if pageControl.currentPage == 0{
    }
  }
  
  @IBAction func leftImage(_ sender: Any) {
    let x = CGFloat(pageControl.currentPage-1) * scrollView.frame.size.width
    scrollView.contentOffset = CGPoint(x: x, y: 0)
    pageControl.currentPage -= 1
    if pageControl.currentPage == 0{
      
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
//    cell.textLabel?.sizeThatFits(<#T##size: CGSize##CGSize#>)
    
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath)
    choiseSize.text = "   \((cell?.textLabel?.text!)!)"
    sizeTableView.isHidden = true
  }
}
