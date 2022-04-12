//
//  ViewController.swift
//  realm_study
//
//  Created by 한경수 on 2022/04/11.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let realm = try! Realm()
    
    // Create
    let phonebook = Phonebook(number: "010-2407-1387")
    
    try! realm.write {
      realm.add(phonebook)
    }
    
    // Retrieve
    let books = realm.objects(Phonebook.self).filter("number == %@", "010-1234-5678")
    
    // Update
    let toUpdate = books[0]
    
    try! realm.write {
      toUpdate.name = "Lee"
    }
    
    let updatedBooks = realm.objects(Phonebook.self)
    
    // Delete
    let toDelete = updatedBooks[0]
    
    try! realm.write {
      realm.delete(toDelete)
    }
    
    let deletedBooks = realm.objects(Phonebook.self)
  }
}

class Phonebook: Object {
  @Persisted(primaryKey: true) var number: String?
  @Persisted var name: String = ""
  @Persisted var status: String = ""
  
  convenience init(number: String) {
    self.init()
    self.number = number
  }
  
}

