//
//  QuoteController.swift
//  KanyeQuotes
//
//  Created by Thomas Cowern New on 12/6/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class QuoteController {
    
    
    static let shared = QuoteController() ; private init() {}
    
    
    // MARK: - CRUD
    func createQuote(with text: String) {
        Quote(text: text)
        saveToPeristentStorage()
    }
    
    func delete(quote: Quote) {
        CoreDataStack.context.delete(quote)
        saveToPeristentStorage()
    }
    
    func toggle(quote: Quote) {
        if quote.isKanyeQuote == true {
            quote.isKanyeQuote = false
        } else {
            quote.isKanyeQuote = true
        }
        saveToPeristentStorage()
//        quote.isKanyeQuote = quote.isKanyeQuote ? false : true
        
//        quote.isKanyeQuote = !quote.isKanyeQuote
        
//        quote.isKanyeQuote.toggle()
    }
    
    func saveToPeristentStorage() {
        print("Saving to persistent storage")
        do {
            try CoreDataStack.context.save()
        } catch {
            print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
        }
    }
}
