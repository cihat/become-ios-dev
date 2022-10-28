//
//  PhotoPicker.swift
//  TemperatureConverter
//
//  Created by Cihat Salik on 25.10.2022.
//

import UIKit
import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> some UIViewController {

    let pickerController = UIImagePickerController()
    
    return pickerController
  }
}
