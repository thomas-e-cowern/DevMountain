import Foundation

var str = "Hello, playground"

// if/else FizzBuzz

//for i in 0...100 {
//    if i % 3 == 0  && i % 5 == 0 {
//        print("FizzBuzz")
//    } else if i % 3 == 0 {
//        print("Fizz")
//    } else if i % 5 == 0 {
//        print("Buzz")
//    } else {
//        print(i)
//    }
//}

// switch FizzBuzz

for i in 0...100 {
    switch (i % 3 == 0, i % 5 == 0, i) {
    case (true, _, _):
        print("Fizz")
    case (_, true, _):
        print("Buzz")
    default:
        print(i)
    }
}
