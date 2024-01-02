//
// Task.swift
// W2-D3_Task
//


import Foundation

class Task: Codable {
    
    // MARK: - Properties
    
    var name: String
    var notes: String?
    var dueDate: Date?
    var isComplete: Bool
    let uuid: String
    
    // memberwise initializer
    init(name: String, notes: String?, dueDate: Date?, isComplete: Bool = false, uuid: String = UUID().uuidString) {
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
        self.uuid = uuid
    }
}

// MARK: - Extension Equatable

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
