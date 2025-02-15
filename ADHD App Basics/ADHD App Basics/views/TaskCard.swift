//
//  TaskCard.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-02-14.
//

import SwiftUI

struct TaskCard: View {
    
    //the initialized values are the default states for now
    var taskName: String = ""
    var taskStatus: String = "Not Started"
    var taskTag: String = ""
    var taskReminder: Bool = false
    var taskReminderTime: TimeInterval = 0
    var taskSubtask: Bool = false

    //not sure what type to use for the following:
    var taskPriority: Int = 0
    var taskDate: Date = Date()
    //TODO: ^^ Not sure what this does but it was suggested by xcode's auto complete
    
    
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TaskCard()
}
