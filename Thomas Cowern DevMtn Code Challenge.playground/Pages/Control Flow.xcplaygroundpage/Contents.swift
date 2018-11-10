/*:

## Control Flow

Write a function that prints the numbers from 1 to 100. But for multiples of three print “Dev” instead of the number and for the multiples of five print “Mountain”. For numbers which are multiples of both three and five print “DevMountain”.
*/
func devMountain () {
    for index in 1...100 {
        
        if index % 5 == 0 && index % 3 == 0 {
            print("DevMountain")
        } else if index % 5 == 0 {
            print("Mountain")
        } else if index % 3 == 0 {
            print("Dev")
        } else {
            print(index)
        }
    }
}
//: Demo the use of your function here. Go to View -> Debug Area -> Show Debug Area to see the logged results.
devMountain()

//: [Previous](@previous)
//: [Next](@next)
