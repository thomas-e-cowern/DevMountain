import Foundation

var population: Int = 250000

var message: String = ""

var hasPostOffice: Bool = false

if population < 10000 {
    
    message = "\(population) is a small town"
    
} else if population >= 10000 && population < 50000 {
        
    message = "\(population) is a medium town"
    
} else if population >= 100000 && population < 250000 {
    
    message = "\(population) is a large town"

} else {
        
    message = "\(population) is Huge!"
        
}


if !hasPostOffice {
    print("Where do we buy stamps?")
}

//message = population < 10000 ? "\(population) is a small town" : "\(population) is a big town"

print(message)
