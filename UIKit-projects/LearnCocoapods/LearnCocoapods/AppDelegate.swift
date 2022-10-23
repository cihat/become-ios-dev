//
//  AppDelegate.swift
//  LearnCocoapods
//
//  Created by Cihat Salik on 20.10.2022.
//

import UIKit
import SnapKit
import FLEX
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    IQKeyboardManager.shared.enable = true
    return true
  }
}

