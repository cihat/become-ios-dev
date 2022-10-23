//
//  ViewController.swift
//  ListApp
//
//  Created by Cihat Salik on 19.10.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  
  var alertController = UIAlertController()
  @IBOutlet weak var tableView: UITableView!
  
  //  let data = ["Swift", "Kotlin", "C++", "C", "Python", "Java", "C#"]
  var data = [NSManagedObject]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    
    fetch()
  }
  
  @IBAction func didRemoveBarButtonItemTapped(_ sender: UIBarButtonItem) {
    presentAlert(
      title: "Warning",
      message: "Are you sure you want to delete all the items in the list?",
      defaultButtonTitle: "Yes",
      cancelButtonTitle: "Cancel") { _ in
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedObjectContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ListItem")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        try! managedObjectContext?.execute(deleteRequest)
        try? managedObjectContext?.save()
        self.fetch()
        
//        self.data.removeAll()
//        self.tableView.reloadData()
      }
  }
  
  @IBAction func didAddBarButtonItemTapped(_ sender: UIBarButtonItem) {
    presentAddAlert()
  }
  
  func presentAddAlert() {
    presentAlert(
      title: "Add new item",
      message: nil,
      defaultButtonTitle: "Add",
      cancelButtonTitle: "Cancel",
      isTextFieldAvailable: true,
      defaultButtonHandle: { _ in
        let text = self.alertController.textFields?.first?.text
        
        if text != "" {
          let appDelegate = UIApplication.shared.delegate as? AppDelegate
          let managedObjectContext = appDelegate?.persistentContainer.viewContext
          let entity = NSEntityDescription.entity(forEntityName: "ListItem", in: managedObjectContext!)
          let listItem = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
          
          listItem.setValue(text, forKey: "title")
          
          try? managedObjectContext?.save()
          
          self.fetch()
        } else {
          self.presentWarningAlert(message: "You cannot add an empty item.", cancelButtonTitle: "Okey")
        }
      })
  }
  
  func presentWarningAlert(message: String, cancelButtonTitle: String) {
    presentAlert(title: "Warning ⚠️ ", message: message, cancelButtonTitle: cancelButtonTitle)
  }
  
  
  func presentAlert(
    title: String?,
    message: String?,
    preferredStyle: UIAlertController.Style = .alert,
    defaultButtonTitle: String? = nil,
    cancelButtonTitle: String?,
    isTextFieldAvailable: Bool = false,
    defaultButtonHandle: ((UIAlertAction) -> Void)? = nil
  ) {
    alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
    
    if defaultButtonTitle != nil {
      let defaultButton = UIAlertAction(title: defaultButtonTitle, style: .default, handler: defaultButtonHandle)
      
      alertController.addAction(defaultButton)
    }
    
    let cancelButton = UIAlertAction(title: cancelButtonTitle, style: .cancel)
    
    if isTextFieldAvailable {
      alertController.addTextField()
    }
    
    alertController.addAction(cancelButton)
    present(alertController, animated: true)
  }
  
  func fetch() {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    let managedObjectContext = appDelegate?.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ListItem")
    
    data = try! managedObjectContext!.fetch(fetchRequest)
    
    tableView.reloadData()
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //    let cell = UITableViewCell
    let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
    
    let listItem = data[indexPath.row]
    cell.textLabel?.text = listItem.value(forKey: "title") as? String
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let deleteAction = UIContextualAction(style: .normal, title: "Delete") { _, _, _ in

      let appDelegate = UIApplication.shared.delegate as? AppDelegate
      let managedObjectContext = appDelegate?.persistentContainer.viewContext
      managedObjectContext?.delete(self.data[indexPath.row])
      try? managedObjectContext?.save()
      self.fetch()
      
      tableView.reloadData()
    }
    
    let editAction = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
      self.presentAlert(
        title: "Edit this item",
        message: nil,
        defaultButtonTitle: "Edit",
        cancelButtonTitle: "Cancel",
        isTextFieldAvailable: true,
        defaultButtonHandle: { _ in
          let text = self.alertController.textFields?.first?.text
          
          if text != "" {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let managedObjectContext = appDelegate?.persistentContainer.viewContext
            self.data[indexPath.row].setValue(text, forKey: "title")
            
            if managedObjectContext!.hasChanges {
              try? managedObjectContext?.save()
            }
            
            self.tableView.reloadData()
          } else {
            self.presentWarningAlert(message: "You cannot edit an empty item.", cancelButtonTitle: "Okey")
          }
        })
      
    }
    
    deleteAction.backgroundColor = .systemRed
    let config = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    
    return config
  }
}
