import UIKit

func longestWord(string: String) -> String {
    
    let stringWithoutPunc = string.components(separatedBy: CharacterSet.punctuationCharacters).joined()
    
    print(stringWithoutPunc)
    
    let longestWord = stringWithoutPunc.components(separatedBy: " ").max(by: { $1.count > $0.count })
    
    return longestWord ?? "Happy New Year"
}

longestWord(string: "This string, has a gigantic! word in it...")
longestWord(string: "one, two, three")
