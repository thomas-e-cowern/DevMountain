import UIKit
import NotificationCenter

let schoolBellA = Notification.Name("School Bell A Notification")
let schoolBellB = Notification.Name("School Bell B Notification")

class ClassRoom{
    
    @objc func excuseStudents(){
        print("Excuse students")
    }
    
    func addSchoolBellObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(excuseStudents), name: schoolBellA, object: nil)
    }
}

class GymClass: ClassRoom{
    @objc override func excuseStudents() {
        print("The Gym students are being excused from class")
    }
}

class EnglishClass: ClassRoom{
    
    @objc func workHarder(){
        print("The English Students are working harder now")
    }
    
    override func addSchoolBellObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(workHarder), name: schoolBellA, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(excuseStudents), name: schoolBellB, object: nil)
    }
    
    @objc override func excuseStudents() {
        print("The English Students are being excused from class")
    }
}

class MathClass: ClassRoom{
    
    @objc func workHarder(){
        print("The Mathletes are working harder now")
    }
    
    
    override func addSchoolBellObserver() {
        super.addSchoolBellObserver()
        NotificationCenter.default.addObserver(self, selector: #selector(workHarder), name: schoolBellB, object: nil)
    }
    
    @objc override func excuseStudents() {
        print("The Mathletes are being excused from class")
    }
}

let gym = GymClass()
let english = EnglishClass()
let math = MathClass()

[gym, english, math].forEach{ $0.addSchoolBellObserver() }

//NotificationCenter.default.post(name: schoolBellA, object: nil)
NotificationCenter.default.post(name: schoolBellB, object: nil)
NotificationCenter.default.post(name: schoolBellA, object: nil)
