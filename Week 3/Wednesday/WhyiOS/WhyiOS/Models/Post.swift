//
//  Post.swift
//  WhyiOS
//
//  Created by Thomas Cowern New on 12/12/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation

struct Post: Codable {
    var cohort: String?
    var name: String
    var reason: String
    
    init(name: String, reason: String, cohort: String?) {
        self.name = name
        self.reason = reason
        self.cohort = cohort
    }
    
    init?(dict: [String : String]) {
        // 1. Look up and unwrap all NECESSARY properties from the jsonDictionary
        guard let name = dict["name"],
            let reason = dict["reason"] else { return nil }
        
        self.name = name
        self.reason = reason
        self.cohort = dict["cohort"]
    }
}

//extension Post: Codable {
//    
//}
