import UIKit

protocol Beverage {
    var baseCost: Double { get }
    var name: String { get }
    
    func totalCost() ->  Double
    func description() -> String
}

extension Beverage {
    
    func totalCost() -> Double {
        return baseCost
    }
    
    func description() -> String {
        return name
    }
}

protocol Cusomization: Beverage {
    var beverage: Beverage { get set }
}

extension Cusomization {
    func totalCost() -> Double {
        return baseCost + beverage.totalCost()
    }
    
    func description() -> String {
        return beverage.description() + " " + name
    }
}

class Espresso: Beverage {
    let baseCost: Double
    let name: String
    
    init(name: String, baseCost: Double) {
        self.name = name
        self.baseCost = baseCost
    }
}

class ExtraShot: Cusomization {
    var beverage: Beverage
    var baseCost: Double
    var name: String
    
    init(beverage: Beverage, baseCost: Double, name: String) {
        self.beverage = beverage
        self.baseCost = baseCost
        self.name = name
    }
}

let latte = Espresso(name: "Latte", baseCost: 4.50)
let latteWithShot = ExtraShot(beverage: latte , baseCost: 1, name: "with Extra Shot")

latteWithShot.description()
    

