import UIKit

class Car {
    var make: String
    var model: String
    var year: Int
    var vin: String
    
    init(make: String, model: String, year: Int, vin: String) {
        self.make = make
        self.model = model
        self.year = year
        self.vin = vin
    }
}

let accord = Car(make: "Honda", model: "Accord", year: 2011, vin: "1wbeuqhduahdd8")

let f150 = Car(make: "Ford", model: "F150", year: 2015, vin: "1JDH5KKSDFNDA8JSDKDL")

let elantra = Car(make: "Hundai", model: "Elanra", year: 2017, vin: "9GFJ573HDFNSDF94")

let cars = [accord, f150, elantra]

let SecondAccord = Car(make: "Honda", model: "Accord", year: 2011, vin: "1wbeuqhduahdd8")

extension Car: Equatable {
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.make == rhs.make &&
        lhs.model == rhs.model &&
        lhs.year == rhs.year &&
        lhs.vin == rhs.vin
    }
}

accord == f150
accord == SecondAccord

cars.contains(SecondAccord)
