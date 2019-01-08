import UIKit

func add(_ ints: Int...) -> Int {
    var result = 0
    for int in ints {
        result += int
    }
    print("Sample text for a Black Diamond")
    return result
}

add(3, 7, 2, 9, 12, 11)
