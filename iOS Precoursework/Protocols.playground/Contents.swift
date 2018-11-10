//import UIKit
import Foundation

//var str = "Hello, playground"

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    
    func itemFor(row: Int, column: Int) -> String
}

func printTable(_ dataSource: TabularDataSource & CustomStringConvertible ) {

    var column0Contents: [String] = []
    var column1Contents: [String] = []
    var column2Contents: [String] = []
    var columnContentsWidthArray: [Int] = []
    
    // Find the max width for each column based on content width
    for i in 0 ..< dataSource.numberOfRows {
        
        for j in 0 ..< dataSource.numberOfColumns {

            let contentsItem = dataSource.itemFor(row: i, column: j)
            
            switch j {
            case 0:
                column0Contents.append(contentsItem)
//                columnContentsWidthArray.append((contentsItem.count))
            case 1:
                column1Contents.append(contentsItem)
//                columnContentsWidthArray.append((contentsItem.count))
            default:
                column2Contents.append(contentsItem)
//                columnContentsWidthArray.append((contentsItem.count))
            }
        }
    }
    
    if let column0ContentsWidth = (column0Contents.map {$0.count}).sorted().last {
        columnContentsWidthArray.append(column0ContentsWidth)
    }
    if let column1ContentsWidth = (column1Contents.map {$0.count}).sorted().last {
        columnContentsWidthArray.append(column1ContentsWidth)
    }
    if let column2ContentsWidth = (column2Contents.map {$0.count}).sorted().last {
        columnContentsWidthArray.append(column2ContentsWidth)
    }
    
    
//    print(columnContentsWidthArray)

    
    // Find the max width for label columns

    var columnLabelWidthArray: [Int] = []
    
    for i in 0 ..< dataSource.numberOfColumns {
        
        let columnLabelWidth = dataSource.label(forColumn: i).count
        
        columnLabelWidthArray.append(columnLabelWidth)
        
    }
    
//    print("columnLableWidthArray: \(columnLabelWidthArray)")
    
    // Compare label and contents to figure determine column width
    
    var finalColumnWidthArray: [Int] = []
    
    for x in 0 ..< 3 {
        if columnLabelWidthArray[x] > columnContentsWidthArray[x] {
            finalColumnWidthArray.append(columnLabelWidthArray[x])
        } else {
            finalColumnWidthArray.append(columnContentsWidthArray[x])
        }
    }
    
//    print(finalColumnWidthArray)
    
    print("Table: \(dataSource.description)")
    
    var firstRow = "|"
    var spacing = " "

        for b in 0 ..< dataSource.numberOfColumns {
            let columnLabel = dataSource.label(forColumn: b)
            
            var columnHeader = " \(columnLabel) |"
            print(columnHeader.count - finalColumnWidthArray[b])
            if (columnHeader.count - finalColumnWidthArray[b]) > 0 {
                print("Header is less than array")
                for c in 0 ..< columnHeader.count - finalColumnWidthArray[b] {
                    spacing += " "
                }
            } else {
                firstRow += columnHeader
            }
            print(finalColumnWidthArray[b])
//            firstRow += columnHeader

        }
    print("\(firstRow)")
    
        for i in 0 ..< dataSource.numberOfRows {

        // Start the output string
        var out = "|"

        // Append each item in this row to the string
        for j in 0 ..< dataSource.numberOfColumns {
//            print("i = \(i), j = \(j)")
//            print(out)
            let item = dataSource.itemFor(row: i, column: j)
//            print(item)
            let paddingNeeded = finalColumnWidthArray[j] - item.count
//            print(paddingNeeded)
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            out += " \(padding)\(item) |"
        }
    
//         Done - print it!
        print(out)
    }
}

//let data = [["Joe", "30", "6"],["Karen", "40", "18"],["Fred", "50", "20"]]
//
//printTable(data, withColumnLabels: "Employee Name", "Age", "Years of Experience")

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Department (\(name))"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0: return "Employee Name"
        case 1: return "Age"
        case 2: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
  
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        switch column {
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid column!")
        }
    }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Joe", age: 10000, yearsOfExperience: 6))
department.add(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Fred", age: 50, yearsOfExperience: 20))

printTable(department)






