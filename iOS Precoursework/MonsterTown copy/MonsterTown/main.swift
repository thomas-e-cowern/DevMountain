//
//  main.swift
//  MonsterTown
//
//  Created by Thomas Cowern New on 9/24/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

//print("Hello, World!")

var myTown = Town()

myTown.changePopulation(by: 1)

let myTownSize = myTown.townSize

print(myTownSize)

print("Size: \(myTown.townSize); population: \(myTown.population)")

//myTown.printDescription()

//let genericMonster = Monster()

//genericMonster.town = myTown

//genericMonster.terrorizeTown()

let fredTheZombie = Zombie()

fredTheZombie.town = myTown

fredTheZombie.terrorizeTown()

fredTheZombie.town?.printDescription()

let newVampire = Vampire()

newVampire.town = myTown

newVampire.terrorizeTown()

newVampire.town?.printDescription()

print("Victim pool: \(fredTheZombie.victimPool)")

fredTheZombie.victimPool = 500

print("Victim pool: \(fredTheZombie.victimPool)")

print(Zombie.spookyNoise)

print(Monster.spookyNoise)

if Zombie.isTerrifying {
    print("Run away!")
}

myTown.changePopulation(by: 1)
