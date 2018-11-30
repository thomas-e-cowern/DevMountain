import UIKit

var str = "Hello, playground"

class Person {
    var name: String
    var favoriteColor: String?
    var favoriteMovie: String?
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, favoriteColor: String?, favoriteMovie: String?) {
        self.name = name
        self.favoriteColor = favoriteColor
        self.favoriteMovie = favoriteMovie
    }
    
    func description () {
        
        if let _ = newPerson.favoriteColor {
            var favoriteColor = newPerson.favoriteColor
        }
        
        if let _ = newPerson.favoriteMovie {
            var favoriteMovie = newPerson.favoriteMovie
        }
  
        
        if newPerson.favoriteMovie == nil && newPerson.favoriteColor == nil {
            print("\(newPerson.name) doesn't like anything")
        } else if newPerson.favoriteMovie != nil {
             print("\(newPerson.name) favorite movie is \(favoriteMovie)")
        } else if newPerson.favoriteColor != nil {
            print("\(newPerson.name) favorite color is \(favoriteColor)")
        } else {
            print("\(newPerson.name) favorite movie is \(favoriteMovie) and favorite color is \(favoriteColor)")
        }
    }
}

var newPerson = Person(name: "Tom")

newPerson.favoriteColor = "Blue"

//print("Name: \(newPerson.name)")
//
//if let favoriteColor = newPerson.favoriteColor {
//    print("Favorite Color: \(favoriteColor)")
//} else {
//    print("Favorite Color: \(newPerson.favoriteColor)")
//}
//
//if let favoriteMovie = newPerson.favoriteMovie {
//    print("Favorite Movie: \(favoriteMovie)")
//} else {
//    print("Favorite Movie: \(newPerson.favoriteMovie)")
//}

 newPerson.description()


