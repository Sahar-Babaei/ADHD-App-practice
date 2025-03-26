//
//  TaskCreationViewModel.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-03-25.
//

import Foundation

class TaskCreationViewModel: ObservableObject {
    
    //mentor: do I need to reference the taskbank viewmodel to get access to the same faketask array?
    var taskBankViewModel: TaskBankViewModel?
    
    //want to be able to reference the FakeTask properties to bind the user's input to a new entry to the array
    func addTaskfromTaskCreation() {
        taskBankViewModel?.addTask()
    }
}
