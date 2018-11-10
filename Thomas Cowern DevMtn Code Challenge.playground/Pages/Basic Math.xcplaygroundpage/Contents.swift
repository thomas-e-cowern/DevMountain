/*:
## Basic Math

Demonstrate basic knowledge of functions that take parameters and return results by implementing some basic math functions.
*/
//: Write a function that returns the sum of two numbers
func addTwoNumbers(numberOne: Int, numberTwo: Int) -> Int {
    let total = numberOne + numberTwo
    return total
}
//: Write a function that returns the product of two numbers
func multiplyTwoNumbers(numberOne: Int, numberTwo: Int) -> Int {
    let total = numberTwo * numberTwo
    return total
}
//: Write a function that returns the average (mean) of an array of numbers
func meanAnArrayOfNumbers(numbers: [Float]) -> Float {
    
    var total: Float = 0.0
    
    for number in numbers {
        total = total + number
    }
    
    let mean = total/Float(numbers.count)
    
    return mean
}

//: Demo the use of your functions here:
addTwoNumbers(numberOne: 3, numberTwo: 5)

multiplyTwoNumbers(numberOne: 2, numberTwo: 8)

meanAnArrayOfNumbers(numbers: [1.0, 2.0, 3.0, 4.0, 5.0])
//: [Previous](@previous)
//: [Next](@next)
