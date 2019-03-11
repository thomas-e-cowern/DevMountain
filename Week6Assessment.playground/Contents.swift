import Foundation

var names = ["Anne", "Bob", "Charlie", "Deborah", "Evan", "Francine", "Gerry", "Hilary", "Steve"]

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

func groupByTwos (names: [String])  -> [[String]]{
//    let count = names.count / 2
//    print("Start count: \(count)")
//    var names = names
    var grouped = [[String]]()
//    var newArray = [String]()
//    for _ in 0..<count + 1 {
//        if names.count == 1 {
//            print("should be one")
//            newArray.append(names[0])
//            names.remove(at: 0)
//            print(names)
//        } else if names.count <= 0{
//            print("Zero or less")
//        } else {
//            for _ in 0...1 {
//                newArray.append(names[0])
//                names.remove(at: 0)
//            }
//        }
//        print(newArray)
//        print(count)
//        grouped.append(newArray)
//        print(grouped)
//        newArray = []
//    }
//    print(grouped)
   
    
    
    return grouped
}

groupByTwos(names: names)
print(names)
names.append("Jamie")
groupByTwos(names: names)

let numbers = [1, 2, 3, 4]

let mapped = numbers.map { Array(repeating: $0, count: $0) }

print(mapped)


