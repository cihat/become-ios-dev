//
//  GameController.swift
//  TemperatureConverter
//
//  Created by Cihat Salik on 23.10.2022.
//

import Foundation

class GameController: ObservableObject {
  
  @Published var games: [GameListModel] = []
  
  init() {}
  
  @discardableResult func createGame() -> GameListModel {
    
    let game = GameListModel(random: true)
    games.append(game)
    return game
  }
  
  func delete(at indexSet: IndexSet) {
    
    games.remove(atOffsets: indexSet)
  }
  
  func move(indices: IndexSet, to newOffset: Int) {
    
    games.move(fromOffsets: indices, toOffset: newOffset)
  }
  
  func indexSet(for game: GameListModel) -> IndexSet? {
    
    if let firstIndex = games.firstIndex(of: game) {
      return IndexSet(integer: firstIndex)
    } else {
      return nil
    }
  }
  
  @discardableResult func game(at indexSet: IndexSet) -> GameListModel? {
    
    if let firstIndex = indexSet.first {
      return games[firstIndex]
    }
    return nil
  }
  
  func update(game: GameListModel, newValue: GameListModel) {
    
    if let index = games.firstIndex(of: game) {
      games[index] = newValue
    }
  }
}
