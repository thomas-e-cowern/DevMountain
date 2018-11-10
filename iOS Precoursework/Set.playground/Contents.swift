import UIKit

var str = "Hello, playground"

//var groceryBag = Set<String>()
var groceryBag: Set = ["Apples", "Oranges", "Pineapple"]

//groceryBag.insert("Apples")
//groceryBag.insert("Oranges")
//groceryBag.insert("Pineapple")

for food in groceryBag {
    print(food)
}

let hasBananas = groceryBag.contains("Apples")

let friendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])
var commonGroceryBag = groceryBag.union(friendsGroceryBag)

let roommatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
let itemsToReturn = commonGroceryBag.intersection(roommatesGroceryBag)

let yourSecondBag = Set(["Berries", "Yogurt"])
let roommatesSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjoint(with: roommatesSecondBag)

let myCities = Set(["Atlanta", "Chicago",
                    "Jacksonville", "New York", "San Francisco"])
let yourCities = Set(["Chicago", "San Francisco", "Jacksonville"])

// bronze challenge
let bothCities = myCities.isSuperset(of: yourCities)

// silver challenge
groceryBag.formUnion(friendsGroceryBag)
commonGroceryBag.formIntersection(roommatesGroceryBag)
