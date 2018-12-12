//
//  Person.swift
//  MyFavoirteApp
//
//  Created by Thomas Cowern New on 12/11/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    let favoriteApp: String
}

extension Person {
    
    init?(dict: [String : Any]) {
        guard let name = dict["name"] as? String,
            let favoriteApp = dict["favoriteApp"] as? String else { return nil }
    
        self.name = name
        self.favoriteApp = favoriteApp
        
    }
    
    var asJSONDictionary: [String : Any] {
        return ["name": self.name, "favoriteApp" : self.favoriteApp]
    }
    
    var asData: Data? {
        return (try? JSONSerialization.data(withJSONObject: asJSONDictionary, options: .prettyPrinted))
    }
}
