//
//  GameListItem.swift
//  TemperatureConverter
//
//  Created by Cihat Salik on 24.10.2022.
//

import SwiftUI

struct GameListItem: View {
  
  var game: GameListModel
  var numberFormatter = NumberFormatter()
  
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 4.0) {
        Text(game.name)
          .font(.body)
        Text(game.serialNumber)
          .font(.caption)
          .foregroundColor(Color(white: 0.65))
      }
      Spacer()
      Text(NSNumber(value: game.priceInDollars), formatter: numberFormatter)
        .font(.title2)
        .foregroundColor(game.priceInDollars > 30 ? .blue : .gray)
    }
    .padding(.vertical, 6)
  }
}

struct GameListItem_Preview: PreviewProvider {
  static var previews: some View {
    let item = GameListItem(game: GameListModel(random: true))
      .padding(.horizontal)
      .previewLayout(.sizeThatFits)
    Group {
      item
      
      item
        .preferredColorScheme(.dark)
      
      item
        .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
      
      item
        .environment(\.locale, Locale(identifier: "tr"))
    }
  }
}
