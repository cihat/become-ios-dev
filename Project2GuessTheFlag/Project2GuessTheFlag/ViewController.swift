//
//  ViewController.swift
//  Project2GuessTheFlag
//
//  Created by Cihat Salik on 15.09.2022.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var button1: UIButton!
  @IBOutlet var button2: UIButton!
  @IBOutlet var button3: UIButton!
  
  
  var countries: [String] = [String]()
  var score: Int = 0
  var correctAnswer: Int = 0
  var questionCounter: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    button1.layer.borderWidth = 1
    button2.layer.borderWidth = 1
    button3.layer.borderWidth = 1
    
    button1.layer.borderColor = UIColor.lightGray.cgColor
    button2.layer.borderColor = UIColor.lightGray.cgColor
    button3.layer.borderColor = UIColor.lightGray.cgColor
    
    askQuestion()
  }
  
  func askQuestion(action: UIAlertAction! = nil) {
    countries.shuffle()
    self.correctAnswer = Int.random(in: 0...2)
    
    button1.setImage(UIImage(named: countries[0]), for: .normal)
    button2.setImage(UIImage(named: countries[1]), for: .normal)
    button3.setImage(UIImage(named: countries[2]), for: .normal)
    
    title = countries[correctAnswer].uppercased() + " ~ Score is: " + String(self.score)
  }
  
  
  @IBAction func buttonTapped(_ sender: UIButton) {
    var title: String
    self.questionCounter += 1

    if sender.tag == self.correctAnswer {
      title = "Correct ✅"
      score += 10
    } else {
      title = "Wrong ❌"
      if score > 0 {
        score -= 10
      } else {
        score = 0
      }
    }
    
    var message: String = "You score is \(score)"
    
    let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)

    if self.questionCounter != 10 {
      ac.addAction(UIAlertAction(title: "Next Question", style: .default, handler: askQuestion ))
      present(ac, animated: true)
    } else {
      ac.addAction(UIAlertAction(title: "Finished Game, New Game", style: .default, handler: askQuestion ))
      present(ac, animated: true)
      self.score = 0
      self.questionCounter = 0
    }
  }
  
  
}

