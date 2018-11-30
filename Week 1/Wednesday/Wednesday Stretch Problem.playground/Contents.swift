import UIKit

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

extension Person: Equatable {

    static func ==(lhs: Person, rhs: Person) -> Bool {
        if lhs.firstName != rhs.firstName { return false }
        if lhs.lastName != rhs.lastName { return false }
        if lhs.age != rhs.age { return false }
        
        return true
    }
}
let james = Person(firstName: "James", lastName: "Pacheco", age: 26)
let andrea = Person(firstName: "Andrea", lastName: "Mower", age: 24)
let carol = Person(firstName: "Rebecca", lastName: "Mordo", age: 30)

var clubMembers: [Person] = [james, andrea, carol]

let thanos = Person(firstName: "Thanos", lastName: "Mad Titan", age: 1456)
let thor = Person(firstName: "Thor", lastName: "Asgard", age: 1500)

clubMembers.append(thanos)

func areYouAMemberOfTheClub (person: Person) -> Bool {
//    if clubMembers.index(where: {$0 == person}) != nil {
//        return true
//    }
    return clubMembers.contains(person)
//    return false
}
 areYouAMemberOfTheClub(person: carol)
