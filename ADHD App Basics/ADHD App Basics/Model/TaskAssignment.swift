//
//  TaskAssignment.swift
//  ADHD App Basics
//
//  Created by Ricardo Haro on 2025-04-03.
//

import Foundation


struct TaskAssignment: Codable {
    var date: Date
    var priority: Priority
    
    enum CodingKeys: String, CodingKey {
            case date = "task_assignment_date"
            case priority = "task_assignment_priority"
        }
}

enum Priority: String, Codable {
    case notSelected
    case mustDo
    case doIfPossible
    case niceToDo
}
