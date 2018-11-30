//
//  Person.swift
//  ClubMembers
//
//  Created by Thomas Cowern New on 11/28/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class Person {
    let firstName: String
    let lastName: String
    let age: Int
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

extension Person: Equatable {}

func ==(lhs: Person, rhs: Person) -> Bool {
    if lhs.firstName != rhs.firstName { return false }
    if lhs.lastName != rhs.lastName { return false }
    if lhs.age != rhs.age { return false }
    
    return true
}
