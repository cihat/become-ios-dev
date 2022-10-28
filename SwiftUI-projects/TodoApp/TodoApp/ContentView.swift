//
//  ContentView.swift
//  TodoApp
//
//  Created by Cihat Salik on 28.10.2022.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var dataStore: DataStore
  var body: some View {
    List() {
      ForEach(dataStore.toDos) { toDo in
        Button{
          
        } label: {
          Text(toDo.name)
            .font(.title3)
            .strikethrough(toDo.completed)
            .foregroundColor(toDo.completed ? .green : Color(.label))
        }
      }
    }
    .listStyle(InsetGroupedListStyle())
    .toolbar {
      ToolbarItem(placement: .principal) {
        Text("My ToDos")
          .font(.largeTitle)
          .foregroundColor(.red)
      }
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
            
        } label: {
          Image(systemName: "plus.circle.fill")
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(DataStore())
  }
}
