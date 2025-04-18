//
//  TaskBankViewModel.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-03-20.
//

import Foundation

class TaskBankViewModel: ObservableObject {
    
    @Published var allTasksList : [Task] = []
    @Published var reverseOrder: Bool = false
    @Published var showTextFieldOverlay : Bool = false
    @Published var userTaskTitle : String = ""
    @Published var gridViewEnabled: Bool = false
    
    @Published var selectedTaskList: [Task] = []
    
    
    func loadAllTasks() {
        let retrievedTasks = retrieveTasksFromUserDefaults()
        allTasksList = retrievedTasks
        sortTasks()
    }
    
    //use this view model to keep track of the state of your cards, state of your views: this place holds your data --> View is just reading it 
//    func addTask() {
//        // this only adds a new task if title is not empty
//        guard !userTaskTitle.isEmpty else { return }
//        
//        let newTask  = Task(name: userTaskTitle, ID: UUID(), isCompleted: false)
//        
//        addTaskToUserDefaults(task: newTask)
//        loadAllTasks()
//        clearTitle()
//    }
    
    func getTaskfromId(_ id: String) -> Task? {
        let retrievedTask = retrieveTaskFromUserDefaults(taskID: id)
        
        return retrievedTask
    }
    
    func addTask(_ task: Task) {
      
      
        addTaskToUserDefaults(task: task)
        loadAllTasks()
    }
    
    func removeTask(_ taskToRemove: Task) {
        // There are two things that you can find when you click on an element (I don't know how we need to ask AI or something) either, the index, or the actual ID. Then we
        removeTaskFromUserDefaults(taskID: taskToRemove.ID)
        loadAllTasks()
    }
    
    func removeOldTasks() {
        var existingTasks = retrieveTasksFromUserDefaults()
        
        var oldTasks = existingTasks.filter { task in
            if let completionDate = task.completionDate{
                isOlderThan30Days(completionDate)
            }
            else {
                false
            }
        }
        
        var oldTasksIds = oldTasks.map { $0.ID }
        removeTasksFromUserDefaults(taskIDs: oldTasksIds)
    }
    
    private func isOlderThan30Days(_ date: Date) -> Bool {
        guard let thirtyDaysAgo = Calendar.current.date(byAdding: .day, value: -30, to: Date()) else {
            return false
        }
        return date < thirtyDaysAgo
    }
    
    func updateTask(_ task : Task){
        var existingTasks = retrieveTasksFromUserDefaults()
        
        var indexOfTask = existingTasks.firstIndex { storedTask in
            storedTask.ID == task.ID
        }
        if let index = indexOfTask {
            existingTasks[index] = task
        }
      //  existingTasks.append(task)
       
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(existingTasks) {
            UserDefaults.standard.set(encoded, forKey: "user_tasks")
        }
        loadAllTasks()
    }
    
    func sortTasks() {
        allTasksList = allTasksList.sorted { taskA, taskB in
            if reverseOrder {
                taskA.creationDate > taskB.creationDate
            }
            else{
                taskA.creationDate < taskB.creationDate
            }
        }
    }
    
    func getTodaysTaskForPriority(priority: Priority) -> [Task] {
        let calendar = Calendar.current
        let todaysDate = Date()
        
        return allTasksList.filter {
            if let assignment = $0.taskAssignment {
                return calendar.isDate(assignment.date, inSameDayAs: todaysDate) && assignment.priority == priority
            } else {
                return false
            }
        }
    }
    
    func clearTitle() {
        userTaskTitle = ""
    }
    
}
