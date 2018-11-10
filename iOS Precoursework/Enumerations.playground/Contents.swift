import UIKit

//var str = "Hello, playground"

// enum TextAlignment: Int {
//case left = 20
//    case right = 30
//    case center = 40
//    case justify = 50
//}

// var alignment = TextAlignment.left
// alignment = .right

//if alignment == .right {
//    print("Whe should right align the text")
//}

//switch alignment {
//
//case .left:
//    print("left aligned")
//
//case .right:
//    print("right aligned")
//
//case .center:
//    print("center aligned")
//
//case .justify:
//    print("justify aligned")
//}

//print("Left has raw value \(TextAlignment.left.rawValue)")
//print("Right has raw value \(TextAlignment.right.rawValue)")
//print("Center has raw value \(TextAlignment.center.rawValue)")
//print("Justify has raw value \(TextAlignment.justify.rawValue)")
//print("The alignment variable has raw value \(alignment.rawValue)")

//let myRawValue = 60
//
//if let myAlignment = TextAlignment(rawValue: myRawValue) {
//    
//    print("successfully converted \(myRawValue) into a TextAlignment")
//} else {
//    
//    print("\(myRawValue) has no corresponding TextAlignment case")
//}

// enum ProgrammingLanguage: String {
//    case swift      //= "swift"
//    case objectiveC = "objective-c"
//    case c          //= "c"
//    case cpp        = "c++"
//    case java      //= "java"
//}

//let myFavoriteLanguage = ProgrammingLanguage.swift
//print("My favorite programming language is \(myFavoriteLanguage.rawValue)")

//enum LightBulb {
//    case on
//    case off
//
//    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double {
//        switch self {
//        case .on:
//            return ambient + 150.0
//
//        case .off:
//            return ambient
//        }
//   }
//
//    mutating func toggle() {
//        switch self {
//        case .on:
//            self = .off
//
//        case .off:
//            self = .on
//        }
//    }
//
//}

//var bulb = LightBulb.on
//let ambientTemperature = 77.0

//var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
//print("the bulb's temperature is \(bulbTemperature)")

//bulb.toggle()
//bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
//print("the bulb's temperature is \(bulbTemperature)")

enum ShapeDimensions {
    
    case point
    
    case square(side: Double)
    
    case rectangle(width: Double, height: Double)
    
    // Bronze challenge
    case perimeter(leftSide: Double, rightSide: Double, top: Double, bottom: Double)
    
    // Silver challenge
    case rightTriangle(base: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case .point:
            return 0
            
        case let .square(side: side):
            return side * side
            
        case let .rectangle(width: w, height: h):
            return w * h
        
        // Bronze challenge
        case let .perimeter(leftSide: l, rightSide: r, top: t, bottom: b):
            return l + r + t + b
            
        // SIlver challenge
        case let .rightTriangle(base: a, height: b):
            return (a * b) / 2
        }
    }
}

var squareShape = ShapeDimensions.square(side: 10.0)
var rectShape = ShapeDimensions.rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.point
// Bronze challenge
var perimeter = ShapeDimensions.perimeter(leftSide: 2, rightSide: 2, top: 2, bottom: 2)
// Silver Challenge
var triangleArea = ShapeDimensions.rightTriangle(base: 3, height: 4)

print(squareShape)
print(rectShape)
print("square's area = \(squareShape.area())")
print("rectangle's area = \(rectShape.area())")
print("point's area = \(pointShape.area())")
print("perimeter's area = \(perimeter.area())")
print("right triagnle's area = \(triangleArea.area())")

indirect enum FamilyTree {
    case noKnownParents
    case oneKnownParent(name: String, ancestors: FamilyTree)
    case twoKnownParents(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
}

let fredAncestors = FamilyTree.twoKnownParents( fatherName: "Fred Sr.", fatherAncestors: .oneKnownParent(name: "Beth", ancestors: .noKnownParents),motherName: "Marsha", motherAncestors: .noKnownParents)



