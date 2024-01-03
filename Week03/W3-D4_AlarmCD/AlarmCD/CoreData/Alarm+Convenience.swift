//
//
// AlarmCD
// 
// Alarm+Convenience.swift
//
// Created by Royal Blue Software
// 


import CoreData

extension Alarm {
    @discardableResult
    convenience init(title: String, isEnabled: Bool = false, fireDate: Date, uuidString: String = UUID().uuidString, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.title = title
        self.isEnabled = isEnabled
        self.fireDate = fireDate
        self.uuidString = uuidString
    }
}
