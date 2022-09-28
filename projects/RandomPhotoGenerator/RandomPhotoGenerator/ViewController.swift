//
//  ViewController.swift
//  RandomPhotoGenerator
//
//  Created by Cihat Salik on 28.09.2022.
//

import UIKit

class ViewController: UIViewController {
  
  private let imageView: UIImageView = {
    let  imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.backgroundColor = .white
    return imageView
  }()
  
  private let button: UIButton = {
    let button = UIButton()
    button.setTitle("Random Photo", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .white
    
    return button
  }()
  
  @objc func didTabButton() {
    getRandomPhoto()
    
    view.backgroundColor = colors.randomElement()
  }
  
  let colors: [UIColor] = [
    .systemPink,
    .systemBlue,
    .systemGreen,
    .systemYellow,
    .systemPurple,
    .systemOrange,
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemPink
    view.addSubview(imageView)
    imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
    imageView.center = view.center
    view.addSubview(button)
    button.addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
    
    getRandomPhoto()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    button.frame = CGRect(x: 30,
                          y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                          width: view.frame.size.width - 60,
                          height: 55
    )
  }
  
  func getRandomPhoto() {
    let urlString = "https://source.unsplash.com/random/600x600"
    let url = URL(string: urlString)!
    guard let data = try? Data(contentsOf: url) else {
      return
    }
    
    imageView.image = UIImage(data: data)
  }
}

