import UIKit

let currentYear: Int = 2018

let currentDate = Date()

let currentYear2 = Calendar.current.component(.year, from: Date())

struct Person {
    let firstName: String
    let lastName: String
    var yearOfBirth: Int
    var age: Int {
        get {
            return currentYear - yearOfBirth
        }
        set (newAge){
            yearOfBirth = currentYear - newAge
        }
    }
}

var tom = Person(firstName: "Tom", lastName: "Cowern", yearOfBirth: 1967)
tom.age = 22
tom.yearOfBirth = 2000
print(tom.yearOfBirth)
print("\(tom.firstName) \(tom.lastName)")
print(tom.age)
print(tom.yearOfBirth)
print(currentYear2)
print(currentDate)

