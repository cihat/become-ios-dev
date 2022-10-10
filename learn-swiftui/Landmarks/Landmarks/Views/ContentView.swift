//
//  ContentView.swift
//  Landmarks
//
//  Created by Cihat Salik on 9.10.2022.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    LandmarkList()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(ModelData())
  }
}
