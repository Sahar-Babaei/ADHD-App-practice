//
//  FakeTask.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-03-03.
//

import Foundation
import SwiftUI


struct FakeTask{
    var fTaskName: String = "this would be the task name"
    
    var fTaskID = UUID()
    var fTaskCategory : [String] = ["No category"] 
    var fTaskCompleted: Bool = false
    var fTaskStatus: String = "Not Started"
    var fTaskCreationDate : Date = Date()
    var fTaskCompletionDate : Date? = nil // Optional date for when the task is completed
    
}
