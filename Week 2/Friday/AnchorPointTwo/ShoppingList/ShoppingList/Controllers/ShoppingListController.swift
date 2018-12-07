//
//  ShoppingListController.swift
//  ShoppingList
//
//  Created by Thomas Cowern New on 12/7/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation
import CoreData

class ShoppingListController {
    
    // MARK: - Properties
    // MARK: - Singleton
    static let shared = ShoppingListController()
    
    // MARK: - CRUD Operations
    func addItem(name: String) {
        ShoppingList(name: name, isBought: false)
        saveToPersistenStorage()
    }
    
    func deleteItem(shoppingList: ShoppingList) {
        CoreDataStack.context.delete(shoppingList)
        saveToPersistenStorage()
    }
    
    // MARK: - Methods
    func toggle(shoppingList: ShoppingList) {
        if shoppingList.isBought == true {
            shoppingList.isBought = false
        } else {
            shoppingList.isBought = true
        }
        saveToPersistenStorage()
    }
    
    // MARK: - Save data in CORE DATA
    func saveToPersistenStorage() {
        print("Saving to persistent storage")
        do {
            try CoreDataStack.context.save()
        } catch {
            print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
        }
    }
    
}
