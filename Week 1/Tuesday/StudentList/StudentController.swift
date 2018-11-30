//
//  StudentController.swift
//  StudentList
//
//  Created by Thomas Cowern New on 11/27/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class StudentController {
    
    init() {
        students = [Student(firstName: "Andrew", lastName: "Madsen", age: 32), Student(firstName: "Steve", lastName: "Jobs", age: 61), Student(firstName: "Tom", lastName: "Cowern", age: 51)]
    }
    
    // CRUD
    
    func create(studentWithFirstName firstName: String, lastName: String, age: Int) -> Student {
        let student = Student(firstName: firstName, lastName: lastName, age: age)
        self.students.append(student)
        return student
    }
    
    func delete(student: Student) {
        if let index = self.students.index(where: {$0 == student}) {
            self.students.remove(at: index)
        }
    }
    var students: [Student]
}
