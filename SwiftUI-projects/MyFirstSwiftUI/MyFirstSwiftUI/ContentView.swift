//
//  ContentView.swift
//  MyFirstSwiftUI
//
//  Created by Cihat Salik on 21.10.2022.
//

import SwiftUI

struct ContentView: View {
  
  @State var isTurkish: Bool = false
  
  var body: some View {
    VStack {
      if isTurkish {
        Text("Merhaba Dunya!")
      } else {
        Text("Hello, world!")
      }
      Button(action: {
        self.isTurkish.toggle()
      }, label: {
        Text(isTurkish ? "Merhaba" : "Hello")
      })
    }
    .font(.title2)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
