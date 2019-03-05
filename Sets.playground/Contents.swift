import UIKit

class Person{
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension Person: Hashable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
    
    var hashValue: Int {
        return name.hashValue
    }
}

var personSet = Set<Person>()

let jack = Person(name: "Jack", age: 22)
let tom = Person(name: "Tom", age: 51)
let steve = Person(name: "Steve", age: 29)
let andriy = Person(name: "Andriy", age: 29)
let brady = Person(name: "Brady", age: 30)
let frank = Person(name: "Frank", age: 30)
let trevor = Person(name: "Trevor", age: 22)

//personSet.insert(jack)
//personSet.insert(tom)
//personSet.insert(steve)
//personSet.remove(tom)
//
//personSet.contains(tom)
//personSet.contains(trevor)

var mentors: Set<Person> = Set(arrayLiteral: trevor, frank)
var students: Set<Person> = Set(arrayLiteral: tom, andriy, jack, steve, brady)
var putputFans: Set<Person> = Set(arrayLiteral: trevor, brady, steve)
var tallPeople: Set<Person> = Set(arrayLiteral: trevor, andriy, brady)
//var allPeople: Set<Person> = [jack, steve, tom, frank, brady, andriy, steve, trevor, steve, steve, steve]

let allPeople = students.union(mentors)
print(allPeople.map { $0.name })
let shortPeople = allPeople.subtracting(tallPeople)
print(shortPeople.map { $0.name })

let tallStudent = students.intersection(tallPeople)
print(tallStudent.map { $0.name })

let tallStudentPutPutFans = students.intersection(tallPeople).intersection(putputFans)
print(tallStudentPutPutFans.map { $0.name })

let everyoneWhoIsTallOrAStudentButDefinatelyNotBoth = students.symmetricDifference(tallPeople)

print(everyoneWhoIsTallOrAStudentButDefinatelyNotBoth.map { $0.name })
