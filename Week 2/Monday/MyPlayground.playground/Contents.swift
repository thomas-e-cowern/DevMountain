import UIKit

let calendar = Calendar.current

var components = DateComponents()

components.day = 11
components.month = 6
components.year = 2018
components.hour = 6
components.minute = 15

let newDate = calendar.date(from: components)

print(newDate!)
