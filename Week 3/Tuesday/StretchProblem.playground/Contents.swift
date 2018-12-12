
import UIKit

let testDictionary: [String: Any] = ["name":"Derek","age":28,"hasLice":false,"timeSinceBirth":28.2345,"siblingNames":["Eve","Harmon","Gerald","Marty"]]

let jsonString = """
{"name": "Derek","age": 28,"hasLice": false,"timeSinceBirth": 28.2345,"siblingNames": ["Eve","Harmon","Gerald","Marty"]}
"""

let data = jsonString.data(using: .utf8, allowLossyConversion: false)!


//do {
//
//    let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//
//    if let name = jsonDictionary["name"] {
//
//        print("name is: \(name)")
//
//    }
//
//    if let age = jsonDictionary["age"] {
//
//        print("age is: \(age)")
//
//    }
//
//    if let hasLice = jsonDictionary["hasLice"] {
//
//        print("hasLice is: \(hasLice)")
//
//    }
//
//    if let timeSinceBirth = jsonDictionary["timeSinceBirth"] {
//
//        print("timeSinceBirth is: \(timeSinceBirth)")
//
//    }
//
//    if let siblingNames = jsonDictionary["siblingNames"] as? [String] {
//
//        for name in siblingNames {
//
//            print("sibling name is: \(name)")
//
//        }
//
//    }
//
//} catch {
//
//    print("Failed to deserialize JSON: \(error.localizedDescription)")
//
//}

//class Person {
//
//    var name: String
//
//    var age: Int
//
//    var hasLice: Bool
//
//    var timeSinceBirth: Double
//
//    var siblingNames: [String]
//
//
//
//    init?(jsonDictionary: [String: Any]) {
//
//        guard let name = jsonDictionary["name"] as? String,
//
//            let age = jsonDictionary["age"] as? Int,
//
//            let hasLice = jsonDictionary["hasLice"] as? Bool,
//
//            let timeSinceBirth = jsonDictionary["timeSinceBirth"] as? Double,
//
//            let siblingNames = jsonDictionary["siblingNames"] as? [String] else {
//
//                return nil
//
//        }
//
//        self.name = name
//
//        self.age = age
//
//        self.hasLice = hasLice
//
//        self.timeSinceBirth = timeSinceBirth
//
//        self.siblingNames = siblingNames
//
//    }
//
//}

class Person1: Codable {
    var name: String
    var age: Int
    var hasLice: Bool
    var timeSinceBirth: Double
    var siblingNames: [String]
    
    init(name: String, age: Int, hasLice: Bool, timeSinceBirth: Double, siblingNames: [String]) {
        self.name = name
        self.age = age
        self.hasLice = hasLice
        self.timeSinceBirth = timeSinceBirth
        self.siblingNames = siblingNames
    }
}

do {
    let jsonDecoder = JSONDecoder()
    let newPerson = try jsonDecoder.decode(Person1.self, from: data)
    print(newPerson.hasLice)
} catch {
    print(error)
}

