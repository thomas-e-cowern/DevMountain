import Foundation
var str = "Hello, playground"

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]

print("I have rated \(movieRatings.count) movies")

let darkoRating = movieRatings["Donnie Darko"]

movieRatings["Dark City"] = 5

movieRatings

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")

if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}

movieRatings["The Cabinet of Dr. Caligari"] = 5

print("I have rated \(movieRatings.count) movies")

//movieRatings.removeValue(forKey: "Dark City")

movieRatings["Dark City"] = nil

//for (key, value) in movieRatings {
//    print("The movie \(key) was rated \(value).")
//}
//
//for movie in movieRatings.keys {
//    print("User has rated \(movie).")
//}

let album = [
    "Diet Roast Beef": 268,
    "Dubba Dubbs Stubs His Toe": 467,
    "Smokey's Carpet Cleaning Service": 187,
    "Track 4": 221
]

let watchedMovies = Array(movieRatings.keys)

//Silver Challenge
var northCarolinaCounties = ["Alamance County": [12345, 29876, 45678, 30947, 36296], "Alexander County":[19356, 28463, 18735, 12412, 49794], "Anson County":[75648, 13243, 91479, 31928, 48736]]

var zipCodes: [Int] = []

for (_, value) in northCarolinaCounties {
    zipCodes = zipCodes + value
}

print("North Carolina has the following zip codes: \(zipCodes)")

// Gold challenge

var ncZips = ""

let spaces = "                                            "

for i in 0...zipCodes.count - 1 {
    switch i {
    case 0:
        ncZips = ncZips + "\(zipCodes[i]), "
    case 4, 9:
        ncZips = ncZips + "\(zipCodes[i]), \n \(spaces)"
    case 14:
        ncZips = ncZips + "\(zipCodes[i])"
    default:
        ncZips = ncZips + "\(zipCodes[i]), "
    }
}

var modString = "North Carolina has the following zip codes: [\(ncZips)]"

print("\(modString)")
