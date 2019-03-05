import UIKit

var names = ["Anne", "Bob", "Charlie", "Deborah", "Evan", "Francine", "Gerry", "Hilary"]

func shuffleNames (names: [String]) -> [String] {
    var names = names
    var shuffled = [String]()
    for _ in 0..<names.count {
        let rand = Int(arc4random_uniform(UInt32(names.count)))
        shuffled.append(names[rand])
        names.remove(at: rand)
    }
    return shuffled
}

print(shuffleNames(names: names))

func groupByTwos (names: [String]) {
    var names = names
    var grouped = [[String]]()
    var newArray = [String]()
    for _ in 0..<names.count {
        if names.count >= 2 {
            for y in 0..<2 {
                newArray.append(names[y])
            }
            grouped.append(newArray)
        } else {
            
        }
    }
}
