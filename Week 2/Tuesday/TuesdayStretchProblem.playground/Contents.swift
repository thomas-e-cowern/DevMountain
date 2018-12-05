import UIKit

protocol Vehicle {
    var speed: Double { get set }
    var isMoving: Bool { get set }
    
//    func startMoving()
//
//    func stopMoving()
}

extension Vehicle {
    mutating func startMoving() {
        if isMoving == false {
            isMoving = true
            print("The vehicle is moving at \(speed) miles per hour")
        } else {
            isMoving = false
            print("The vehicle is not moving")
        }
    }
    
    mutating func stopMoving() {
        if isMoving == false {
            isMoving = true
            print("The vehicle is moving at \(speed) miles per hour")
        } else {
            isMoving = false
            print("The vehicle is not moving")
        }
    }
}

class LawnMower: Vehicle {
    
    var speed: Double
    var isMoving: Bool
    
    init(speed: Double, isMoving: Bool) {
        self.speed = speed
        self.isMoving = isMoving
    }
    
//    func startMoving() {
//        if isMoving == false {
//            isMoving = true
//            print("The vehicle is moving")
//        } else {
//            isMoving = false
//            print("The vehicle is not moving")
//        }
//    }
//
//    func stopMoving() {
//        if isMoving == false {
//            isMoving = true
//            print("The vehicle is moving")
//        } else {
//            isMoving = false
//            print("The vehicle is not moving")
//        }
//    }
//
    
}

class Truck: Vehicle {
    
    var speed: Double
    var isMoving: Bool

    init(speed: Double, isMoving: Bool) {
        self.speed = speed
        self.isMoving = isMoving
    }
    
//    func startMoving() {
//        if isMoving == false {
//            isMoving = true
//            print("The vehicle is moving")
//        } else {
//            isMoving = false
//            print("The vehicle is not moving")
//        }
//    }
//
//    func stopMoving() {
//        if isMoving == false {
//            isMoving = true
//            print("The vehicle is moving")
//        } else {
//            isMoving = false
//            print("The vehicle is not moving")
//        }
//    }
}

var newTruck = Truck(speed: 35, isMoving: false)
var newLawnMower = LawnMower(speed: 5, isMoving: true)

newTruck.startMoving()
newLawnMower.stopMoving()


