//
//  ContentView.swift
//  Landmarks
//
//  Created by Cihat Salik on 9.10.2022.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
//      Image(systemName: "globe")
//        .imageScale(.large)
//        .foregroundColor(.green)
      Text("Turtle Rock")
        .font(.largeTitle)
        .fontWeight(.light)
        .foregroundColor(.green)
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
