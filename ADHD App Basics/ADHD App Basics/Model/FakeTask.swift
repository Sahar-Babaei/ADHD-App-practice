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
    var fTaskCategory : [String] = [] //todo: Mentor? how do i give it a default value of "no tag" that can later change to the user's selected category?
    var fTaskCompleted: Bool = false
    var fTaskStatus: String = "Not Started"
    var fTaskCreationDate : Date = Date()
    var fTaskCompletionDate : Date? = nil // Optional date for when the task is completed
    
}
