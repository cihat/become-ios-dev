//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Cihat Salik on 12.10.2022.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
  @EnvironmentObject var modelData: ModelData
  
  var body: some View {
    NavigationView {
      List {
        ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
          Text(key)
        }
      }
      .navigationTitle("Featured")
    }
  }
}

struct CategoryHome_Previews: PreviewProvider {
  static var previews: some View {
    CategoryHome()
      .environmentObject(ModelData())
  }
}
