//
//  GameListView.swift
//  TemperatureConverter
//
//  Created by Cihat Salik on 23.10.2022.
//

import SwiftUI

struct GameListView: View {
  let gameStore = GameStore()
  
  var body: some View {
    List(gameStore.games) { (game) in
      GameListItem(game: game, numberFormatter: Formatters.dollarFormatter )
    }
  }
}

struct GameListView_Previews: PreviewProvider {
  static var previews: some View {
    GameListView()
  }
}

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
