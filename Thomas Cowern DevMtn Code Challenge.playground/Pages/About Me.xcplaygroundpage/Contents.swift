/*:
## About Me

Tell us a little bit about yourself using Swift variables. Start with your first name, your last name, your age, where you're from, and why you want to take the class.
*/
let firstName = "Thomas"
let lastName = "Cowern"
var age = 51
let originalHomeTown = "North Haven, Ct"
let reasonToTakeClass = "I have been an avid Apple fan since 2009.  I have been interested in coding since I taught myself HTML in the late 90's.  I am impressed by the iOS ecosystem and how well all prodcuts work together.  Two years ago I completed a Web Development class with the ultimate goal of become a full time iOS developer"

//: Create an array of Strings that holds a few of your hobbies.
let myHobbies = ["Motorcycling", "Reading", "Writing", "Coding", "Learning", "Cooking"]

/*: 
Programmatically combine the individual strings from your hobbies array into a single string with the hobbies separated by commas.

For example: "Programming, Teaching, Golf, and Basketball."
*/
var myHobbyString: String = ""

let endItem = myHobbies.count

for index in 0..<myHobbies.count {

    if index < endItem - 1 {
        myHobbyString = myHobbyString + "\(myHobbies[index]), "
    } else {
        myHobbyString = myHobbyString + "\(myHobbies[index])."
    }
    
}

print(myHobbyString)
//: Using the variables you have created, write a programmatically generated sentence to introduce yourself. Use only one print() statement.
let myIntroduction = "Hello, my name is \(firstName) \(lastName).  I am \(age) years old.  I am originally from \(originalHomeTown) and am taking this clase because \(reasonToTakeClass)"

print(myIntroduction)
//: [Previous](@previous)
//: [Next](@next)
