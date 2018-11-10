//import UIKit
import Foundation

//var str = "Hello, playground"

let playground = "Hello playground"
var mutablePlayground = "Hello, mutable playground"

mutablePlayground += "!"

//for c: Character in mutablePlayground.characters {
//    print("'\(c)'")
//}

let oneCoolDude = "\u{1F60E}"
let aAcute = "\u{0061}\u{0301}"

//for scalar in playground.unicodeScalars {
//print("\(scalar.value)")
//}

let aAcutePrecomposed = "\u{00E1}"

//print("aAcute: \(aAcute.characters.count); aAcutePrecomposed: \(aAcutePrecomposed.characters.count)")

//let start = playground.startIndex
//let end = playground.index(start, offsetBy: 4)
//let fifthCharacter = playground[end]
//
//let range = start...end
//let firstFive = playground[range]

// Bronze Challenge
//var empty: String = ""
//
//let start = empty.startIndex
//let end = empty.endIndex
//
//let isItEmpty = empty.count

// Silver Challenge
let start = playground.index(playground.startIndex, offsetBy: 6)
let end = playground.index(start, offsetBy: 9)

let range = start...end
let lastWord = playground[range]

let unicodeHello = "\u{0048}\u{0065}\u{006C}\u{006C}\u{006F}"

let newHello = "\(unicodeHello) \(lastWord)"


