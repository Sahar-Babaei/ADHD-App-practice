//
//  UserDefaultsManager.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-03-20.
//

import Foundation

// MARK: - Save Task details
//where will you call this function?
// can not be accessed within a View - will need an observable object

func addTaskToUserDefaults(task: Task) {
    var existingTasks = retrieveTasksFromUserDefaults()
    existingTasks.append(task)
    
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(existingTasks) {
        UserDefaults.standard.set(encoded, forKey: "user_tasks")
    }
}

func removeTaskFromUserDefaults(taskID: UUID) {
    var existingTasks = retrieveTasksFromUserDefaults()
    if let index = existingTasks.firstIndex(where: { $0.ID == taskID }) {
        existingTasks.remove(at: index)
    }
    
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(existingTasks) {
        UserDefaults.standard.set(encoded, forKey: "user_tasks")
    }
}

func removeTasksFromUserDefaults(taskIDs: [UUID]) {     //remove multiple tasks
    var existingTasks = retrieveTasksFromUserDefaults()
    
    existingTasks.removeAll { task in
        taskIDs.contains(task.ID)
    }
    
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(existingTasks) {
        UserDefaults.standard.set(encoded, forKey: "user_tasks")
    }
}

// MARK: - retrieve Task from UserDefaults

func retrieveTasksFromUserDefaults() -> [Task] {
    if let savedData = UserDefaults.standard.data(forKey: "user_tasks") {
        let decoder = JSONDecoder()
        if let loadedUserDetails = try? decoder.decode([Task].self, from: savedData) {
            return loadedUserDetails
        }
    }
    return []
}

//Returns nil if it failed to find the task
func retrieveTaskFromUserDefaults(taskID: String) -> Task? {
    if let savedData = UserDefaults.standard.data(forKey: "user_tasks") {
        let decoder = JSONDecoder()
        if let loadedUserDetails = try? decoder.decode([Task].self, from: savedData) {
            return loadedUserDetails.first { $0.ID.uuidString == taskID }
        }
    }
    return nil
}

// MARK: - clear all Task from UserDefaults

func clearAllTasksFromUserDefault() {
    UserDefaults.standard.removeObject(forKey: "user_tasks")
}
