//
// SchoolTask.swift
// SchoolTasks
//


import UIKit

class SchoolTask: Codable {
    
    // MARK: - Properties
    
    let taskSubject: String
    let taskTitle: String
    let taskImage: String
    var isComplete: Bool
    
    // initializer
    init(taskSubject: String, taskTitle: String, taskImage: String, isComplete: Bool = false) {
        self.taskSubject = taskSubject
        self.taskTitle = taskTitle
        self.taskImage = taskImage
        self.isComplete = isComplete
    }
}

// MARK: - Extension Equatable

extension SchoolTask: Equatable {
    static func == (lhs: SchoolTask, rhs: SchoolTask) -> Bool {
        return lhs.taskTitle == rhs.taskTitle
    }
}
