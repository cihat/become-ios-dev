//
//  PhotoDetailViewController.swift
//  FlickrClientApp
//
//  Created by Cihat Salik on 20.10.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {
  
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var ownerImageView: UIImageView!
  @IBOutlet var ownerNameLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Photo Detail"
    imageView.backgroundColor = .gray
    ownerImageView.backgroundColor = .darkGray
    ownerNameLabel.text = "Owner Name"
    descriptionLabel.text = "Description Label Description Label Description Label Description Label Description Label Description Label Description Label"
  }
}
