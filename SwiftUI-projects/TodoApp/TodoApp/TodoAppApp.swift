//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Cihat Salik on 28.10.2022.
//

import SwiftUI

@main
struct TodoAppApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(DataStore())
    }
  }
}
