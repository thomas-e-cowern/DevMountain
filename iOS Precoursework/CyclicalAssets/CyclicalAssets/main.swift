//
//  main.swift
//  CyclicalAssets
//
//  Created by Thomas Cowern New on 10/5/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

print("Hello, World!")

var bob: Person? = Person(name: "Bob")
var john: Person? = Person(name: "John")
print("created \(bob)")
print("created \(john)")

var laptop: Asset? = Asset(name: "Shiny Laptop", value: 1_500.0)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.0)
var backpack: Asset? = Asset(name: "Blue Backpack", value: 45.0)

bob?.useNetWorthChangedHandler { netWorth in
    print("Bob's net worth is now \(netWorth)")
}

bob?.takeOwnership(of: laptop!)
bob?.takeOwnership(of: hat!)

print("While Bob is alive, hat's owner is \(hat!.owner)")
bob?.surrenderOwnership(of: Asset(name: "Cowboy Hat", value: 175.0))
bob?.surrenderOwnership(of: Asset(name: "Shiny Laptop", value: 1_500.0))
bob = nil
print("the bob variable is now \(bob)")
print("After Bob is deallocated, hat's owner is \(hat!.owner)")

laptop = nil
hat = nil
backpack = nil
