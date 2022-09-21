//
//  StopWatch.swift
//  Stopwatch
//
//  Created by Cihat Salik on 20.09.2022.
//

import UIKit

class StopWatch: NSObject {
  var counter: Double
  var timer: Timer
  
  override init() {
    self.counter = 0.0
    timer = Timer()
  }
}
