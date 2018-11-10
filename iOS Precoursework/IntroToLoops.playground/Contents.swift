//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//
//var students = ["Spencer", "Aaron", "Nick", "Ryan", "Joe"]
//
//for student in students {
//    print(student)
//}
//
//for i in 1...10 {
//    print(i)
//}

var temperatures: [String: Int] = ["Salt Lake City": 27, "New York": 48]

for (city, temp) in temperatures {
    print("it is \(temp) degress in \(city)")
}


var countdown = 20

//while countdown > 0 {
//    print("\(countdown) seconds left")
//    countdown -= 1
//}

repeat {
    print("\(countdown) seconds left")
    countdown -= 1
} while countdown > 0
