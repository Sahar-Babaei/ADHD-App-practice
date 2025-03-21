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

func addTaskToUserDefaults(task: FakeTask) {
    var existingTasks = retrieveTasksFromUserDefaults()
    existingTasks.append(task)
    
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(existingTasks) {
        UserDefaults.standard.set(encoded, forKey: "user_tasks")
    }
}

// MARK: - retrieve Task from UserDefaults

func retrieveTasksFromUserDefaults() -> [FakeTask] {
    if let savedData = UserDefaults.standard.data(forKey: "user_tasks") {
        let decoder = JSONDecoder()
        if let loadedUserDetails = try? decoder.decode([FakeTask].self, from: savedData) {
            return loadedUserDetails
        }
    }
    return []
}

//Returns nil if it failed to find the task
func retrieveTaskFromUserDefaults(taskID: String) -> FakeTask? {
    if let savedData = UserDefaults.standard.data(forKey: "user_tasks") {
        let decoder = JSONDecoder()
        if let loadedUserDetails = try? decoder.decode([FakeTask].self, from: savedData) {
            return loadedUserDetails.first { $0.fTaskID.uuidString == taskID }
        }
    }
    return nil
}

// MARK: - clear all Task from UserDefaults

func clearAllTasksFromUserDefault() {
    UserDefaults.standard.removeObject(forKey: "user_tasks")
}
