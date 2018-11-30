import UIKit

func printX (X: Int, Y: Int) {
    
    guard X > 0 else { return }
    
    for i in 1...Y {
        if i % X == 0 {
            print(i)
        }
    }
}

printX(X: -10, Y: 50)
