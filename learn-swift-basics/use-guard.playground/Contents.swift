//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
  @IBOutlet weak var textfield: UITextField!
  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func button( _ sender: Any) {
    let numberInput = textfield.text ?? ""
    
    if let number = Int(numberInput) {
      label.text = "Input value that \(number) is a number."
    } else {
      label.text = "Input value is not a number"
    }
    
    guard let number2 = Int(numberInput) else {
      label.text = "Input value is not a number"
      return
    }
    
    label.text = "Input value that \(number2) is a number."
    
    
  }
  
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

