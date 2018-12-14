//
//  Contact.swift
//  MyOwnContactList
//
//  Created by Thomas Cowern New on 12/12/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation

struct Contact {
    var firstName: String
    var lastName: String
    var email: String
    var cellPhone: Int?
    var homePhone: Int?
    
    init(firstName: String, lastName: String, email: String, cellPhone: Int?, homePhone: Int?) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.cellPhone = cellPhone
        self.homePhone = homePhone
    }
    
    init?(dict: [String : Any]) {
        guard let firstName = dict["firstName"] as? String,
        let lastName = dict["lastName"] as? String,
        let email = dict["email"] as? String else { return nil }
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.cellPhone = dict["cellPhone"] as? Int
        self.homePhone = dict["homePhone"] as? Int
    }
}

extension Contact: Codable {
    
}
