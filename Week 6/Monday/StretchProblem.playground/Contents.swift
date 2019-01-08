import UIKit

func gameOfThrees(int: Int) -> [Int] {
    
    var resultArray: [Int] = [int]
    
//    var resultDictionary: [Int : Int] = [:]
    
    var result: Int = int
    
    func divideByThree (int: Int) {
        while result > 1 {
            if (result + 1) % 3 == 0 {
                result = (result + 1) / 3
                resultArray.append(result)
//                resultDictionary[result] = -1
                divideByThree(int: result)
            } else {
                result = result / 3
                resultArray.append(result)
//                resultDictionary[result] = 1
                divideByThree(int: result)
            }
        }
    }
    
    divideByThree(int: int)
    
    print("Array: \(resultArray)")
//    print("Dictionary: \(resultDictionary)")
    
    return resultArray
}

gameOfThrees(int: 99)
