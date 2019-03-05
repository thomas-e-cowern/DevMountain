import UIKit

func paliCheck(string: String) -> Bool {
    var stringArray = Array(string)
    var reversedArray: [Character] = []
    
    for i in 0..<stringArray.count {
        reversedArray.insert(stringArray[i], at: 0)
    }
    
    let reversedString = String(reversedArray)
    
    if string == reversedString {
        return true
    } else {
        return false
    }
}

print(paliCheck(string: "wombat"))
