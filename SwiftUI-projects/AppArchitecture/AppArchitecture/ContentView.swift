//
//  ContentView.swift
//  AppArchitecture
//
//  Created by Cihat Salik on 22.10.2022.
//

import SwiftUI

struct ContentView: View {
//  let articles = ["One", "Two", "Three"]
  @ObservedObject var model: Model
  
  var body: some View {
    NavigationView {
      List(model.feed?.items ?? [], id: \.url) { row in
        NavigationLink(destination: Text(row.content)) {
          Text(row.title)
        }
      }
      Color.clear
    }
    .navigationViewStyle(DoubleColumnNavigationViewStyle())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(model: Model())
  }
}
