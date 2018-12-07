//
//  TaskController.swift
//  Task
//
//  Created by Thomas Cowern New on 12/5/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    // MARK: - Proprties
    static var shared = TaskController()

    // MARK: - CRUD
    func add(taskWithName name: String, notes: String?, due: Date?) {
        _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistentStore()
    }
    
    func remove(task: Task) {
        CoreDataStack.context.delete(task)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        
        do {
            try CoreDataStack.context.save()
        } catch {
            print("😡There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
        }
        
        
    }
    
    func fetchTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            return try CoreDataStack.context.fetch(request)
        } catch  {
            print("😡There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
            return []
        }
    }
    
    func toggleIsCompleteForTask(task: Task) {
        if task.isComplete == false {
            task.isComplete = true
        } else {
            task.isComplete = false
        }
        saveToPersistentStore()
    }
    
}
