//
//  ViewController.swift
//  LearnCocoapods
//
//  Created by Cihat Salik on 20.10.2022.
//

import UIKit
import Alamofire
import Kingfisher
import FLEX

struct images {
  static var me: UIImage? { UIImage(named: "me") }
}

class ViewController: UIViewController {
  
  @IBOutlet var redView: UIView!
  @IBOutlet var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.image = images.me
  }
  
  // MARK: - Flex
  func setupFlexGesture() {
    let gesture = UITapGestureRecognizer(target: self, action: #selector(didFlexGestureRecognized(_:)))
    gesture.numberOfTapsRequired = 2
    gesture.numberOfTouchesRequired = 2
    view.addGestureRecognizer(gesture)
  }
  
  @objc func didFlexGestureRecognized(_ sender: UITapGestureRecognizer) {
    FLEXManager.shared.showExplorer()
  }
  
  // MARK: - Kingfisher
  func setImageViaKingfisher() {
    let imageUrl = URL(string: "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg&fm=jpg")
    
    imageView.kf.setImage(with: imageUrl)
  }
  
  // MARK: - Alamofire
  func setImageViaAlamofire() {
    let imageUrl = URL(string: "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg&fm=jpg")
    
    let cache = NSCache<AnyObject, AnyObject>()
    
    if let imageFromCache = cache.object(forKey: imageUrl as AnyObject) as? UIImage {
      imageView.image = imageFromCache
      return
    }
    
    AF.request(imageUrl!, method: .get).response { response  in
      switch response.result {
      case .failure(let error):
        print(error)
      case .success(let data):
        guard let data = data,
              let image = UIImage(data: data) else { return }
        
        cache.setObject(image, forKey: imageUrl as AnyObject)
        self.imageView.image = image
      }
    }
  }
  
  // MARK: - Snapkit
  func setConstraintsViaSnapkit() {
    redView.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.width.equalTo(256.0)
      make.height.equalTo(128.0)
    }
  }
  
  func setConstraintsViaAutoLayout() {
    redView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      redView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      redView.heightAnchor.constraint(equalToConstant: 128.0),
      redView.widthAnchor.constraint(equalToConstant: 256.0)
    ])
  }
  
  
  // MARK: - Alamofire
  func fetchWithAlamofire() {
    AF.request("https://httpbin.org/get").responseJSON { response in
      print(response)
    }
    
    // or
    struct Login: Encodable {
      let email: String
      let password: String
    }
    
    let login = Login(email: "test@test.test", password: "testPassword")
    
    AF.request("https://httpbin.org/post",
               method: .post,
               parameters: login,
               encoder: JSONParameterEncoder.default).response { response in
      debugPrint(response)
    }
  }
  
  // MARK: with URLSession
  func fetchWithURLSession() {
    let url = URL(string: "https://stackoverflow.com")
    let request = URLRequest(url: url!)
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        return
      }
      print(String(data: data, encoding: .utf8) ?? "Data not found or not in correct format.")
    }
    
    task.resume()
  }
  
  
}

