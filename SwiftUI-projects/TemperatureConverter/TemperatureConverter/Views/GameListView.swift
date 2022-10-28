//
//  GameListView.swift
//  TemperatureConverter
//
//  Created by Cihat Salik on 23.10.2022.
//

import SwiftUI

struct GameListView: View {
  @ObservedObject var gameInstance = GameController()
  
  @State var gameToDelete: GameListModel?
  
  var body: some View {
    NavigationView {
      List {
        ForEach(gameInstance.games) { (game) in
          NavigationLink(
            destination:
              DetailView(
                game: game,
                gameController: gameInstance,
                name: game.name,
                price: game.priceInDollars
              )
          ) {
            GameListItem(game: game)
          }
        }
        .onDelete { indexSet in
          self.gameToDelete = gameInstance.game(at: indexSet)
        }
        .onMove { indices, newOffset in
          gameInstance.move(indices: indices, to: newOffset)
        }
      }
      .listStyle(PlainListStyle())
      .navigationTitle("Used Games")
      .navigationBarItems(
        leading: EditButton(),
        trailing: Button(action: {
          gameInstance.createGame()
        }, label: {
          Text("Add")
        }))
      .navigationBarTitleDisplayMode(.large)
      //      .animation(.easeIn)
      .actionSheet(
        item: $gameToDelete) { (game) -> ActionSheet in
          
          
          ActionSheet(
            title: Text("Are you sure ?"),
            message: Text("You will delete \(game.name)"),
            buttons: [
              .cancel(),
              .destructive(Text("Delete"), action: {
                if let indexSet = gameInstance.indexSet(for: game) {
                  gameInstance.delete(at: indexSet)
                }
              })
            ]
          )
        }
    }
    .accentColor(.purple)
  }
}

struct GameListView_Previews: PreviewProvider {
  static var previews: some View {
    GameListView()
  }
}
