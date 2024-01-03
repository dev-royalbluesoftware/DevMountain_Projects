//
//
// W3-D2-3_TaskCoreData
// 
// Task+Convenience.swift
//
// Created by Royal Blue Software
// 

import CoreData

extension Task {
    @discardableResult
    convenience init(name: String, notes: String? = nil, dueDate: Date? = nil, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
}
