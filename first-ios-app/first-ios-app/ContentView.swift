//
//  ContentView.swift
//  first-ios-app
//
//  Created by Cihat Salik on 11.09.2022.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Text("I am learning SwiftUI ❤️❤️❤️❤️❤️")
      .font(.title2)
      .foregroundColor(.gray)
      .multilineTextAlignment(.center)
      .lineLimit(7)
      .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .previewDevice("iPhone 12 Pro Max")
        .previewInterfaceOrientation(.portrait)
    }
  }
}
