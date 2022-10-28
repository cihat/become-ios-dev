//
//  DataStore.swift
//  TodoApp
//
//  Created by Cihat Salik on 28.10.2022.
//

import Foundation

class DataStore: ObservableObject {
  
  init() {
    loadToDos()
  }
    
  @Published var toDos: [ToDo] = []
  
  func addToDo(_ toDo: ToDo) {
    
  }
  
  func updateToDo(_ toDo: ToDo) {
    
  }
  
  func deleteToDo(at indexSet: IndexSet) {
    
  }
  
  func loadToDos() {
    toDos = ToDo.sampleData
  }
  
  func saveToDos() {
    print("Saving toDos to file system eventually 👍🏻")
  }
}
