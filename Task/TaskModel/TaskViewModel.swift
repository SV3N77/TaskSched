//
//  TaskViewModel.swift
//  Task
//
//  Created by Justin Yuen on 16/5/22.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
    @Published var currentTab: String = "Upcoming"
    
    // new task properties
    @Published var openEditTask: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskDeadline: Date = Date()
    @Published var taskType: String = "Basic"
}

