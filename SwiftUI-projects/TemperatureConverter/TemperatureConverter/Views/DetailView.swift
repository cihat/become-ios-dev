//
//  DetailView.swift
//  TemperatureConverter
//
//  Created by Cihat Salik on 24.10.2022.
//

import SwiftUI
import Combine

struct DetailView: View {
  
  var game: GameListModel
  
  var gameController: GameController
  
  @State var name: String = ""
  @State var price: Double = 0.0
  @State var shouldEnableSaveButton: Bool = true
  
  @State var isPhotoPickerPresenting: Bool = false
  
  @State var selectedPhoto: UIImage?
  
  func validate() {
    shouldEnableSaveButton = game.name != name || game.priceInDollars != price
  }
  
  var body: some View {
    Form {
      Section {
        VStack(alignment: .leading, spacing: 6.0) {
          Text("Name")
            .font(.caption)
            .foregroundColor(.secondary)
          TextField("Name", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .onReceive(Just(name)) { newValue in
              validate()
            }
        }.padding(.vertical, 4.0)
        
        VStack(alignment: .leading, spacing: 6.0) {
          Text("Price in Dollars")
            .font(.caption)
            .foregroundColor(.secondary)
          TextField(
            "Price",
            value: $price,
            formatter: Formatters.dollarFormatter)
          .keyboardType(.decimalPad)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .onReceive(Just(price)) { newValue in
            validate()
          }
        }.padding(.vertical, 4.0)
      }
      Section {
        Button(action: {
          let newGame = GameListModel(
            name: name,
            priceInDollars: price,
            serialNumber: game.serialNumber
          )
          gameController.update(game: game, newValue: newGame)
        }) {
          Text("Save")
            .frame(maxWidth: .infinity)
            .frame(minHeight: 30.0)
        }
        .disabled(!shouldEnableSaveButton )
      }
    }
    .toolbar {
      ToolbarItem(placement: .bottomBar) {
        Button(action: {
          isPhotoPickerPresenting = true
        }, label: {
          Image(systemName: "camera")
        })
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .sheet(isPresented: $isPhotoPickerPresenting) {
      PhotoPicker(selectedPhoto: $selectedPhoto)
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    
    let gameController = GameController()
    let game = gameController.createGame()
    
    DetailView(game: game, gameController: gameController)
  }
}
