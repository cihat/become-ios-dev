//
//  TemperatureConverterApp.swift
//  TemperatureConverter
//
//  Created by Cihat Salik on 22.10.2022.
//

import SwiftUI

@main
struct TemperatureConverterApp: App {
  var body: some Scene {
    WindowGroup {
      TabView {
        GameListView()
          .tabItem {
            HStack {
              Image(systemName: "gamecontroller")
              Text("Game List")
            }
          }
        ContentView()
          .tabItem {
            HStack {
              Image(systemName: "thermometer")
              Text("TAB_CONVERSION")
            }
          }
        MapView()
          .tabItem {
            HStack {
              Image(systemName: "map")
              Text("TAB_MAP")
            }
          }
      }
      .accentColor(.purple)
    }
  }
}
