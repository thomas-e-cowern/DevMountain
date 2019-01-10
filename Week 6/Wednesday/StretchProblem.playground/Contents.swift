import UIKit

func findClosestFibonacciNumber(_ number: Int) -> Int{

    var closestNumber = 0
    var currentFibNumber = 0
    guard number > 1 else { return number }
    if currentFibNumber <= number {
        currentFibNumber = findClosestFibonacciNumber(number - 1) + findClosestFibonacciNumber(number - 2)
    } else {
        return currentFibNumber
    }
    return findClosestFibonacciNumber(number - 1) + findClosestFibonacciNumber(number - 2)

}

findClosestFibonacciNumber(10)
