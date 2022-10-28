//
//  PhotoPicker.swift
//  TemperatureConverter
//
//  Created by Cihat Salik on 25.10.2022.
//

import UIKit
import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
  
  @Binding var selectedPhoto: UIImage?
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPicker>) -> some UIViewController {
    
    let pickerController = UIImagePickerController()
    pickerController.allowsEditing = true
    pickerController.sourceType = .photoLibrary
    pickerController.delegate = context.coordinator
    
    return pickerController
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var photoPicker: PhotoPicker
    
    init(_ withPicker: PhotoPicker) {
      
      self.photoPicker = withPicker
      super.init()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
      if let selectedPhoto = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
        photoPicker.selectedPhoto = selectedPhoto
      } else {
        photoPicker.selectedPhoto = nil
      }
    }
  }
}
