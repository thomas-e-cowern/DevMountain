import UIKit

func makeChange(money: Double) -> String {
    
    let dollar: Int = 100
    let quarter: Int = 25
    let dime: Int = 10
    let nickel: Int = 5
    let penny: Int = 1

    let intMoney = Int(money * 100)
    var remainder: Int = 0
    
    var yourChange = ""
    
    let dollars = intMoney / dollar

    remainder = intMoney - (dollars * 100)
    
    let quarters = remainder / quarter
    
    
    
    if dollars >= 1 {
        yourChange = "\(dollars) dollars"
    }
    
    print(intMoney)
    
    
    return yourChange
}

let myCash = makeChange(money: 2.15)

print(myCash)
