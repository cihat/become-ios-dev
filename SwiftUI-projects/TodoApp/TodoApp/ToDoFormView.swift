//
//  ToDoFormView.swift
//  TodoApp
//
//  Created by Cihat Salik on 28.10.2022.
//

import SwiftUI

struct ToDoFormView: View {
  @EnvironmentObject var dataStore: DataStore
  @ObservedObject var formVM: ToDoFormViewModel
  @Environment(\.presentationMode) var presentionMode
  var body: some View {
    NavigationView {
      Form {
        VStack(alignment: .leading) {
          TextField("ToDo", text: $formVM.name)
          Toggle("Completed", isOn: $formVM.completed)
        }
      }
    }
    .navigationTitle("ToDo")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ToDoFormView_Previews: PreviewProvider {
  static var previews: some View {
    ToDoFormView(formVM: ToDoFormViewModel())
      .environmentObject(DataStore())
  }
}
