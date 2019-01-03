import Foundation

func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
    
    if b == 0 {
        return a
    } else {
        return greatestCommonDivisor(b, a % b)
    }
}

greatestCommonDivisor(100, 24)

