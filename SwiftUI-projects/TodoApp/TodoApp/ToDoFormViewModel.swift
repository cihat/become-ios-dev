//
//  ToDoFormViewModel.swift
//  TodoApp
//
//  Created by Cihat Salik on 28.10.2022.
//

import Foundation

class ToDoFormViewModel: ObservableObject {
  @Published var name = ""
  @Published var completed = false
  var id: String?
  
  var updating: Bool {
    id != nil
  }
  
  var isDisabled: Bool {
    name.isEmpty
  }
  
  init() {
    
  }
  
  init(_ currentTodo: ToDo) {
    self.name = currentTodo.name
    self.completed = currentTodo.completed
    id = currentTodo.id
  }
}
