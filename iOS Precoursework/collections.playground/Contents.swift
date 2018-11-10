import Foundation

var str = "Hello, playground"

//var bucketList: Array<String>

var bucketList2: [String] = ["Climb Mt. Everest"]

//var bucketList3 = ["Climb Mt. Everest"]

//bucketList2.append("Fly hot air balloon to Fiji")
//bucketList2.append("Watch the Lord of the Rings trilogy in one day")
//bucketList2.append("Go on a walkabout")
//bucketList2.append("Scuba dive in the Great Blue Hole")
//bucketList2.append("Find a triple rainbow")

var newItems = ["Fly hot air balloon to Fiji", "Watch the Lord of the Rings trilogy in one day", "Go on a walkabout", "Find a triple rainbow", "Scuba dive in the Great Blue Hole"]

for item in newItems {
    bucketList2.append(item)
}

//bucketList2 += newItems
//bucketList2
//
bucketList2.remove(at: 2)
//bucketList2
//
//print(bucketList2.count)
//print(bucketList2[0...2])
//
bucketList2[2] += " in Australia"
//bucketList2[0] = "Climb Mt. Kilimanjaro"
//
//print(bucketList2)

bucketList2.insert("Toboggan across Alaska", at: 2)

//var myronsList = [
//    "Climb Mt. Kilimanjaro",
//    "Fly hot air balloon to Fiji",
//    "Toboggan across Alaska",
//    "Go on a walkabout in Australia",
//    "Find a triple rainbow",
//    "Scuba dive in the Great Blue Hole"
//]
//
//let equal = (bucketList2 == myronsList)

//let lunches = ["Cheeseburger", "Veggie Pizza", "Chicken Salad", "Black Bean Burrito", "Falafel Wrap"]

//Bronze Challenge

var toDoList = ["Take out garbage", "Pay bills", "Cross off finished items"]

var hasElements = toDoList.isEmpty

if hasElements == false {
    print("hasElements has elements")
} else {
    print("hasElements has no elements")
}

// Silver challenge

var i = toDoList.count
var newToDoList = [String]()

while i > 0 {
    newToDoList += [toDoList[i - 1]]
    i -= 1
}

print(newToDoList)


toDoList.reverse()

// Gold Challenge



bucketList2.contains("Fly hot air balloon to Fiji")
if let stringIndex = bucketList2.firstIndex(of: "Fly hot air balloon to Fiji") {
    let newString = bucketList2[stringIndex + 2]
    print(newString)
    
}


