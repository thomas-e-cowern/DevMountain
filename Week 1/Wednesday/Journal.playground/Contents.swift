import UIKit

//var str = "Hello, playground"
//
//import Foundation
//
//class Entry {
//    // MARK: - properties
//    let title: String
//    let text: String
//    var timeStamp: Double {
//        return NSDate().timeIntervalSince1970
//    }
//
//    init(title: String, text: String) {
//        self.title = title
//        self.text = text
//    }
//}
//
//let newEntry = Entry(title: "new entery", text: "new text")
//
//let dateFormatter = DateFormatter()
//dateFormatter.dateStyle = .short
//dateFormatter.timeStyle = .short
//dateFormatter.locale = Locale(identifier: "en_US")
//
//let date = Date(timeIntervalSince1970: newEntry.timeStamp)
//print(dateFormatter.string(from: date))


class Entry: Equatable {
    
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        if lhs.title == rhs.title &&  lhs.text == rhs.text && lhs.timeStamp.isEqual(to: rhs.timeStamp) {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - properties
    var title: String
    var text: String
    var timeStamp: Double {
        return NSDate().timeIntervalSince1970
    }
    
    init(title: String, text: String) {
        self.title = title
        self.text = text

    }
}

class EntryController {
    var entries: [Entry] = []
    
    func addEntryWith(title: String, text: String) {
        let entry = Entry(title: title, text: text)
        entries.append(entry)
    }
    
    func remove(entry: Entry) {
        if let indexOfEntry = entries.index(of: entry) {
            entries.remove(at: indexOfEntry)
        }
    }
    
    func update(entry: Entry, title: String, text: String) {
        if let indexOfEntry = entries.index(of: entry) {
            entries[indexOfEntry].title = title
            entries[indexOfEntry].text = text
        }
        
    }
}

let entryController = EntryController()

entryController.addEntryWith(title: "Number 1", text: "Number One Text")
entryController.addEntryWith(title: "Number 2", text: "Number 2 Text")
print(entryController.entries[0].timeStamp)
print(entryController.entries[0].timeStamp)
print(entryController.entries[0].timeStamp)
print(entryController.entries[0].timeStamp)
print(entryController.entries[1].title)
print(entryController.entries[1].text)
print(entryController.entries.count)

let updateEntry = entryController.entries[1]

entryController.update(entry: updateEntry, title: "New Title", text: "New String")
print(entryController.entries[1].title)
print(entryController.entries[1].text)

let removeEntry = entryController.entries[0]

entryController.remove(entry: removeEntry)

print(entryController.entries.count)

