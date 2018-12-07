//
//  Task+Convenience.swift
//  Task
//
//  Created by Thomas Cowern New on 12/5/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    convenience init(name: String, notes: String?, due: Date?, context: NSManagedObjectContext = CoreDataStack.context) {
        // MARK: - Initializers
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.due = due
    }
}
