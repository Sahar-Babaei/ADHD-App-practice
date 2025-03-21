//
//  TaskBankViewModel.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-03-20.
//

import Foundation

class TaskBankViewModel: ObservableObject {
    
    @Published var allTasksList : [FakeTask] = []
    @Published var reverseOrder: Bool = false
    @Published var showTextFieldOverlay : Bool = false
    @Published var userTaskTitle : String = ""
    @Published var gridViewEnabled: Bool = false
    
    func loadAllTasks() {
        let retrievedTasks = retrieveTasksFromUserDefaults()
        allTasksList = retrievedTasks
        sortTasks()
    }
    
    //use this view model to keep track of the state of your cards, state of your views: this place holds your data --> View is just reading it 
    func addTask() {
        // this only adds a new task if title is not empty
        guard !userTaskTitle.isEmpty else { return }
        
        let newTask  = FakeTask(fTaskName: userTaskTitle, fTaskID: UUID(), fTaskCompleted: false)
        
        addTaskToUserDefaults(task: newTask)
        loadAllTasks()
        clearTitle()
    }
    
    func sortTasks() {
        allTasksList = allTasksList.sorted { taskA, taskB in
            if reverseOrder {
                taskA.fTaskCreationDate > taskB.fTaskCreationDate
            }
            else{
                taskA.fTaskCreationDate < taskB.fTaskCreationDate
            }
        }
    }
    
    func clearTitle() {
        userTaskTitle = ""
    }
    
}
