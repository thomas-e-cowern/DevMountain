import UIKit

func convertToScientificNotation(number: Float) -> String? {
    
    let nsNumber = NSNumber(value: number)
    let formatter = NumberFormatter()
    formatter.numberStyle = .scientific
    return formatter.string(from: nsNumber)
}

convertToScientificNotation(number: 8.9)
