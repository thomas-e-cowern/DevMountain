import UIKit

//var str = "Hello, playground"

// Bronze Challenge

var volunteerCounts = [1,3,40,32,2,53,77,13]

//volunteerCounts = volunteerCounts.sorted { $0 < $1 }
//
//print(volunteerCounts)

// bronze challenge 2

volunteerCounts.sort()

print(volunteerCounts)

// Gold challange

let precinctPopulations = [1244, 2021, 2157]
let projectedPopulations = precinctPopulations.map {
    (population: Int) -> Int in
    return population * 2
}
projectedPopulations

let bigProjections = projectedPopulations.filter {
    (projection: Int) -> Bool in
    
    return projection > 4000
}
bigProjections

let totalProjection = projectedPopulations.reduce(0, +) 
totalProjection

