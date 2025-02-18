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
    var taskName: String = ""
    var taskStatus: String = "Not Started"
    var taskTag: String = ""
    var taskReminder: Bool = false
    var taskReminderTime: TimeInterval = 0   // <---- not sure what datatype to use
    var taskSubtask: Bool = false
    var taskPriority: Int = 0
    var taskDate: Date = Date() // <---- not sure how this would work
    //TODO: ^^ Not sure what this does but it was suggested by xcode's auto complete
    
    
//MARK: - body
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        
        
    }
}

#Preview {
    TaskCard()
}
