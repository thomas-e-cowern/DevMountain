//
//  Quote+Convenience.swift
//  KanyeQuotes
//
//  Created by Thomas Cowern New on 12/6/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation
import CoreData

extension Quote {
    
    @discardableResult
    convenience init(text: String, isKanyeQuote: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        
        self.text = text
        self.isKanyeQuote = isKanyeQuote
        
    }
}
