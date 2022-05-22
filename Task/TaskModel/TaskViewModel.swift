//
//  TaskViewModel.swift
//  Task
//
//  Created by Danny Jiang on 16/5/22.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
    // Supposed to be database to store variables
    @Published var currentTab: String = "Upcoming"
    
    // New task properties
    @Published var openEditTask: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskColor: String = "Red"
    @Published var taskDeadline: Date = Date()
    @Published var datePicker: Bool = false
    
    // Saving the new information to the database
    func addTask(context: NSManagedObjectContext) -> Bool{
        let task = Task(context: context)
        task.title = taskTitle
        task.color = taskColor
        task.deadline = taskDeadline
        task.isCompleted = false
        
        if let _ = try? context.save(){
            return true
        }
        return false
    }
    
    // Reseting data
    func resetTaskData(){
        /*taskType = "Basic"*/
        taskColor = "Red"
        taskTitle = ""
        taskDeadline = Date()
    }
}

