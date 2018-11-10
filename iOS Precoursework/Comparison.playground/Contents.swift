import UIKit

var str = "Hello, playground"

struct Point: Comparable {
    let x: Int
    let y: Int
    
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    
    static func <(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x < rhs.x) && (lhs.y < rhs.y)
    }
    // bronze challenge
    static func +(lhs: Point, rhs: Point) -> (x:Int, y: Int){
        let newPointX = (lhs.x + rhs.x)
        let newPointY = (lhs.y + rhs.y)
        return (x:newPointX, y:newPointY)
    }
}

let a = Point(x:3, y:4)
let b = Point(x:3, y:4)
let c = Point(x:2, y:6)
let d = Point(x:3, y:7)

let abEqaul = (a == b)
let abNotEqual = (a != b)
let cdEqual = (c == d)
let cLessThanD = (c < d)
let cLessThanEqualD = (c <= d)
let cGreaterThanD = (c > d)
let cGreaterThanEqualD = (c >= d)

let myNewPoint = (a + b)
print(myNewPoint)


