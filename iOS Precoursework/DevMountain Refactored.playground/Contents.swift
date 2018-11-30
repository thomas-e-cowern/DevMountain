import UIKit

//var str = "Hello, playground"

func devMountain(x: Int) {

    for i in 1...x {
        
        if i % 3 == 0 && i % 5 == 0 {
            print("DevMountain")
        } else if i % 3 == 0 {
            print("Dev")
        } else if i % 5 == 0 {
            print("Mountain")
        } else {
            print(i)
        }
        
    }
}

devMountain(x: 10)
