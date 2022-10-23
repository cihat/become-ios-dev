//
//  GameStoreController.swift
//  TemperatureConverter
//
//  Created by Cihat Salik on 23.10.2022.
//

import Foundation

class GameStore {
  
  var games: [GameListModel] = []
  
  init() {
    for _ in 0..<5 {
      createGame()
    }
  }
  
  @discardableResult func createGame() -> GameListModel {
    
    let game = GameListModel(random: true)
    games.append(game)
    return game
  }
}
