//
// Task.swift
// W2-D6_TaskAC
//


import Foundation

// Codable handles both Encode/Decode.  Model conforms to Codable for Persistence
class Task: Codable {
    
    // MARK: - Properties
    
    var name: String
    var notes: String?
    var isComplete: Bool
    let uuid: String
    
    // initializer
    /*
     by passing in a default value for isComplete and uuid into the initializer
     upon creation, all Tasks will have the isComplete property set to false and a uuid.
     */
    init(name: String, notes: String?, isComplete: Bool = false, uuid: String = UUID().uuidString) {
        self.name = name
        self.notes = notes
        self.isComplete = isComplete
        self.uuid = uuid
    }
}

// MARK: - Extension Equatable
/*
 conforming our Task to Equatable, will allow to compare instances of Task to determine if they
 are the same Task. (deletion)
 */

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
