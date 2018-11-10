import UIKit

//var str = "Hello, playground"

for i in 1...100 {
    
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
