import UIKit

func numberPrinter(number: Int) {

    switch number {
    case 1:
        for _ in 1...5 {
            print(" |")
        }
    case 2:
        print(" ", terminator:"")
        for _ in 1...2 {
            
            print("-", terminator:"")
        }
        print("-")
        print("    |")
        print(" ", terminator:"")
        for _ in 1...2 {
            
            print("-", terminator:"")
        }
        print("-")
        print("|")
        print(" ", terminator:"")
        for _ in 1...2 {
            
            print("-", terminator:"")
        }
        print("-")
    case 3:
        print(" ", terminator:"")
        for _ in 1...2 {
            print("-", terminator:"")
        }
        print("-")
        print("    |")
        print(" ", terminator:"")
        for _ in 1...2 {
            
            print("-", terminator:"")
        }
        print("-")
        print("    |")
        print(" ", terminator:"")
        for _ in 1...2 {
            
            print("-", terminator:"")
        }
        print("-")
    case 4:
        for _ in 1...2 {
            print(" |  |")
        }
        print("  __ ")
        for _ in 1...2 {
            print("    |")
        }
    case 5:
        print(" ", terminator:"")
        for _ in 1...2 {
            
            print("-", terminator:"")
        }
        print("-")
        print("|")
        print(" ", terminator:"")
        for _ in 1...2 {
            
            print("-", terminator:"")
        }
        print("-")
        print("    |")
        print(" ", terminator:"")
        for _ in 1...3 {
            
            print("-", terminator:"")
        }

    default:
        print("That is not a number")
    }
    
}

//numberPrinter(number: 3)
numberPrinter(number: 5)
