//
//  ShoppingList+Convenience.swift
//  ShoppingList
//
//  Created by Thomas Cowern New on 12/7/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation
import CoreData

extension ShoppingList {
    
    // MARK: - Initializers
    @discardableResult
    convenience init(name: String, isBought: Bool, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.isBought = isBought
    }
}
