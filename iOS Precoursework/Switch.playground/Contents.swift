//: Playground - noun: a place where people can play

import Foundation
//import Cocoa

//var str = "Hello, playground"
//
//var statusCode: Int = 404
//
//var errorString: String = "The request failed with the error:"
//
//switch statusCode {
//
//case 100, 101:
//    errorString += " infomrational, \(statusCode)."
//
//case 204:
//    errorString += " Successful but no content, 204."
//
//case 300...307:
//    errorString += " Redirection, \(statusCode)."
//
//case 400...417:
//    errorString += " Client error, \(statusCode)."
//
//case 500...505:
//    errorString += " Server error, \(statusCode)."
//
//case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
//    errorString = "\(unknownCode) is not a known error code."
//
//default:
//    errorString = "Unexpected error encounted."

//case let unknownCode:
//    errorString = "\(unknownCode) in not a known error code."
//
    
//    case 400:
//        errorString = "Bad Request"
//
//    case 401:
//        errorString = "Unauthorized"
//
//    case 403:
//        errorString = "Forbidden"
//
//    case 404:
//        errorString = "Not Found"
//
//    case 400, 401, 403, 404:
//        errorString = "There was something wrong with the request."
//    fallthrough
//
//    default:
//        errorString += " Please review the request and start again."
//}

//print(errorString)

// Bronze Challenge

let point = (x: 1, y: 4)

switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")

case let q2 where (point.x < 0) && point.y > 0:
    print("\(q2) is in quadrant 2")

case let q3 where (point.x < 0) && point.y < 0:

    print("\(q3) is in quadrant 3")

case let q4 where (point.x > 0) && point.y < 0:
    print("\(q4) is in quadrant 4")

case (_, 0):
    print("\(point) sits on the x-axis")

case (0, _):
    print("\(point) sits on the y-axis")

default:
    print("Case not covered.")
}

// Silver Challenge

let age = 35

if case 18...35 = age, age >= 21, age < 30 {
    print("In cool demographic and of drinking age in the United States")
} else if age >= 30 {
    print("Well, kinda old and all...")
}

