//
//  TaskCard.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-02-14.
//

import SwiftUI

struct TaskCard: View {
    
//MARK: - Variables
    //the initialized values are the default states for now
    
    var taskName: String = ""                //   <-- Task name
    var taskStatus: String = "Not Started"   //   <-- Completion status
    var taskTag = [String]()                 //   <-- Tags associated with it
    var taskPriority: Int = 0                //   <-- what is the priority (0 is no priority)
    var taskDuration: Int = 0                //   <-- how long the task would take
    
    var taskDueDate: Date = Date()           //   <-- the due date for the task
    var taskReminder: Bool = false           //   <-- reminder to notify you to do the task
    var taskReminderTime: TimeInterval = 0   //   <-- what time the reminder would go off
    //TODO: ^not sure if i'm approaching this right
    
    var taskSubtask: Bool = false            //   <-- will the task have subtasks?
    //TODO: mentor? ^how do i create variables for subtasks when i don't know how many subtasks there will be?
    
    var taskCreationDate: Date = Date()      //   <-- time/date the task was created
    
    //idea: add a variable to keep track of "overdue" tasks?
    
    
//MARK: - body
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        
        
    }
}

#Preview {
    TaskCard()
}
