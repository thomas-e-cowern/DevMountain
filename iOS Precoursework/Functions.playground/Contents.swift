import UIKit

//var str = "Hello, playground"
//
//func printGreeting() {
//    print("Hello, playground.")
//}
//printGreeting()

//func printPersonalGreeting(name: String) {
//    print("Hello \(name), welcome to your playground.")
//}
//printPersonalGreeting(name: "Tom")

//func divisionDescriptionFor(numerator: Double, denominator: Double, withPunctuation punctuation: String = ".") {
//    print("\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)")
//}
//divisionDescriptionFor(numerator: 9.0, denominator: 3.0)

//func printPersonalGreeting(to name: String) {
//    print("Hello \(name), welcome to your playground.")
//}
//printPersonalGreeting(to: "Thomas")

//func printPersonalGreetings(to names: String...) {
//    for name in names {
//        print("Hello \(name), welcome to the playground.")
//    }
//}
//printPersonalGreetings(to: "Alex","Chris","Drew","Pat")

//var error = "The request failed:"
//func appendErrorCode(_ code: Int, toErrorString errorString: inout String) {
//    if code == 400 {
//        errorString += " bad request."
//    }
//}
//appendErrorCode(404, toErrorString: &error)
//error

//func divisionDescriptionFor(numerator: Double, denominator: Double, withPunctuation punctuation: String = ".") -> String {
//    return "\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)"
//}
//print(divisionDescriptionFor(numerator: 9.0, denominator: 3.0, withPunctuation: "!"))
//
//func areaOfTriangleWith(base: Double, height: Double) -> Double {
//    let numerator = base * height
//    func divide() -> Double {
//        return numerator / 2
//    }
//
//    return divide()
//}
//areaOfTriangleWith(base: 3.0, height: 5.0)

//func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {
//    var evens = [Int]()
//    var odds = [Int]()
//    for number in numbers {
//        if number % 2 == 0 {
//            evens.append(number)
//        } else {
//            odds.append(number)
//        }
//    }
//    return (evens, odds)
//}
//
//let aBunchOfNumbers = [10,1,4,3,57,43,84,27,156,111]
//let theSortedNumbers = sortedEvenOddNumbers(aBunchOfNumbers)
//print("The even numbers are: \(theSortedNumbers.evens); the odd numbers are: \(theSortedNumbers.odds)")

//func grabMiddleName(fromFullName name: (String, String?, String)) -> String? {
//    return name.1
//}
//
//let middleName = grabMiddleName(fromFullName: ("Matt",nil,"Mathias"))
//if let theName = middleName {
//    print(theName)
//}

//func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
//    guard let middleName = name.middle else {
//        print("Hey there!")
//        return
//    }
//    print("Hey \(middleName)")
//}
//greetByMiddleName(fromFullName: ("Thomas", nil,"Cowern"))

// Bronze Challenge

func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle else {
        print("Hey there!")
        return
    }
    guard middleName.count > 3 else {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)")
}
greetByMiddleName(fromFullName: ("Thomas", "Bob","Cowern"))

// Silver Challenge

func siftBeans(list: [String]) -> (beans: [String], otherGroceries: [String]) {
//    print(list)
    var beans = [String]()
    var otherGroceries = [String]()
    
    for item in list {
        if item.hasSuffix("Beans") {
            beans.append(item)
        } else {
            otherGroceries.append(item)
        }
    }
    return (beans, otherGroceries)
}

var siftResults = siftBeans(list: ["Apples", "Corn", "Kidney Beans", "Milk", "Pinto Beans", "Cheese"])

print(siftResults)
