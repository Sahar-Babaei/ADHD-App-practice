//
//  TaskCreationViewModel.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-03-25.
//

import Foundation

class TaskCreationViewModel: ObservableObject {
    
    @Published var fTask: Task = Task()
    
    //mentor: do I need to reference the taskbank viewmodel to get access to the same faketask array?
//    var taskBankViewModel: TaskBankViewModel?
    
    //want to be able to reference the FakeTask properties to bind the user's input to a new entry to the array
    func createTask() -> Task? {
        // this only adds a new task if title is not empty
        
        guard !fTask.name.isEmpty else { return nil }
        //Add any data checks before allowing a task to be added to memory
        
        //temporary placement
        fTask.taskAssignment = TaskAssignment(date: Date(), priority: .notSelected)
        
        let taskToReturn = fTask
        resetTask()
            
        return taskToReturn
    }
    
    

    private func resetTask() {
        fTask = Task()
    }
}
