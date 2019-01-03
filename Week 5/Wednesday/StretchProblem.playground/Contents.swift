import Foundation

func isItAPalindrome(text: String) -> Bool {
    
    // Removing spaces
    let textWithoutSpaces = text.components(separatedBy: " ").joined().lowercased()
    
    // Removing punctuation
    let textWithoutPunctuation = textWithoutSpaces.components(separatedBy: CharacterSet.punctuationCharacters).joined()
    
    // Reversing the string
    let textBackward = String(textWithoutPunctuation.reversed())
    
    // Comparing iniital string with reversed string and returning boolean result
    return textWithoutPunctuation == textBackward 
}

//extension String {
//    var isItAPalindrome: Bool {
//        let textWithoutSpaces = string.components(separatedBy: " ").joined().lowercased()
//
//        let textWithoutPunctuation = textWithoutSpaces.components(separatedBy: CharacterSet.punctuationCharacters).joined()
//
//        let textBackward = String(textWithoutPunctuation.reversed())
//
//        if textWithoutPunctuation == textBackward {
//            print("It's a palindrome")
//            return true
//        } else {
//            print("Don't know what this is...")
//            return false
//        }
//    }
//}

isItAPalindrome(text: "pAnna")

print("Hey this is a test sentence".components(separatedBy: " ").joined())

