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
    
    @State var task: Task
    @State private var isTaskCompled = false
    
//    @State private var taskName: String
//    @State private var taskDueDate: Date
//    init(task: Task)    {
//        self.task = task
//        _taskName = State(initialValue: task.taskName)
//        _taskDueDate = State(initialValue: task.taskDueDate)
//    }
    
    

    
//MARK: - body
    var body: some View {
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
            HStack{
                Checkbox(isChecked: $isTaskCompled);                TextField("Enter your task here", text: $task.taskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }
            .padding()
            
            
            DatePicker(selection: $task.taskDueDate, label: { Text("Date") })
                .padding()
        }
        
        
    }
}

#Preview {
    TaskCard(task: Task(taskName: ""))
}


//    var taskName: String = ""                //   <-- Task name
//    var taskStatus: String = "Not Started"   //   <-- Completion status
//    var taskTag = [String]()                 //   <-- Tags associated with it
//    var taskPriority: Int = 0                //   <-- what is the priority (0 is no priority)
//    var taskDuration: Int = 0                //   <-- how long the task would take
//
//    var taskDueDate: Date = Date()           //   <-- the due date for the task
//    var taskReminder: Bool = false           //   <-- reminder to notify you to do the task
//    var taskReminderTime: TimeInterval = 0   //   <-- what time the reminder would go off
//    //TODO: ^not sure if i'm approaching this right
//
//    var taskSubtask: Bool = false            //   <-- will the task have subtasks?
//    //TODO: mentor? ^how do i create variables for subtasks when i don't know how many subtasks there will be?
//
//    var taskCreationDate: Date = Date()      //   <-- time/date the task was created
    
    //idea: add a variable to keep track of "overdue" tasks?
    //try not to store another value ie taskOverdue into its own var if it can be dervieved from a simpler from?
    // to make your own custom textfield: you will need to make a struct and define everything there
