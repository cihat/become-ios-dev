//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Cihat Salik on 20.09.2022.
//

import UIKit

import Foundation

class Stopwatch: NSObject {
  var counter: Double
  var timer: Timer
  
  override init() {
    counter = 0.0
    timer = Timer()
  }
}
