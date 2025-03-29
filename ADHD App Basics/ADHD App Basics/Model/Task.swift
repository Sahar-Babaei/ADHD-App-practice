//
//  FakeTask.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-03-03.
//

import Foundation
import SwiftUI


struct Task: Codable {
    var name: String = "remember to change this to an empty string before the app's release"
    
    var ID = UUID()
    //var fTaskCategory : [String] = ["No category"]
    var tag : Tag = .school
    var notes: String = ""
    var isCompleted: Bool = false
    var status: Status = .plannedForToday
    var creationDate : Date = Date()
    var completionDate : Date? = nil // Optional date for when the task is completed
    
    
    enum CodingKeys: String, CodingKey {
            case name = "task_name"
            case ID = "task_id"
            case tag = "task_tag"
            case notes = "task_notes"
            case isCompleted = "task_completed"
            case status = "task_status"
            case creationDate = "task_creation_date"
            case completionDate = "task_completion_date"
        }
    
}





// Note for self:
// When you want to instantiate (create) an object of the FakeTask structure,
// 1)
// Since your FakeTask struct has default values for each property, you don't have
// to explicitly provide values when you create a new FakeTask
// let task = FakeTask() // ---> This will use the default values for all properties
// 2)
// If you want to provide your own values for any of the properties
// You can initialize a FakeTask by providing values for as many or as few properties as you like.
// let task67 = FakeTask(name: "wash dishes", fTaskCategory: ["Work"])


// For structs in Swift:
// If the properties have default values (like your FakeTask struct), you don’t need to pass anything when instantiating the struct
// If a property does not have a default value (for example, if you didn’t provide a default for a property), you must pass it when you create a new instance of the struct.




                                                    
                                                    
