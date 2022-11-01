//
//  LoadingView.swift
//  WeatherDemo
//
//  Created by Cihat Salik on 31.10.2022.
//

import SwiftUI

struct LoadingView: View {
  var body: some View {
    ProgressView()
      .progressViewStyle(CircularProgressViewStyle(tint: .white))
      .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

struct LoadingView_Previews: PreviewProvider {
  static var previews: some View {
    LoadingView()
  }
}
