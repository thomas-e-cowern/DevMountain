import UIKit

var str = "Hello, playground"

let testDictionary: [String: Any] = ["name":"Derek","age":28,"hasLice":false,"timeSinceBirth":28.2345,"siblingNames":["Eve","Harmon","Gerald","Marty"]]

let jsonString = """
{"name": "Derek","age": 28,"hasLice": false,"timeSinceBirth": 28.2345,"siblingNames": ["Eve","Harmon","Gerald","Marty"]}
"""

let data = jsonString.data(using: .utf8, allowLossyConversion: false)!

class Person {
    let name: String
    let age: Int
    let hasLice: Bool
    let siblingNames: [String]
    
    init?(_ dict: [String : Any]) {
        guard let name = dict["name"] as? String,
        let age = dict["age"] as? Int,
        let hasLice = dict["hasLice"] as? Bool,
        let siblingNames = dict["siblingNames"] as? [String] else {
             return nil
        }
        
        self.name = name
        self.age = age
        self.hasLice = hasLice
        self.siblingNames = siblingNames
    }
}

let newPerson = Person(testDictionary)

