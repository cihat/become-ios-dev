//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Cihat Salik on 12.10.2022.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
  var categoryName: String
  var items: [Landmark]
  
  var body: some View {
    Text(categoryName)
      .font(.headline)
  }
}

struct CategoryRow_Previews: PreviewProvider {
  static var landmarks = ModelData().landmarks
  
  static var previews: some View {
    CategoryRow(
      categoryName: landmarks[0].category.rawValue,
      items: Array(landmarks.prefix(3))
    )
  }
}
