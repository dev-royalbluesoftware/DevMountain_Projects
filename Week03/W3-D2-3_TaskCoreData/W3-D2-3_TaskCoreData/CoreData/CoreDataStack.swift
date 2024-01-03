//
//
// W3-D2-3_TaskCoreData
// 
// CoreDataStack.swift
//
// Created by Royal Blue Software
// 


import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "W3_D2_3_TaskCoreData")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Error loading persistent stores \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { container.viewContext }
    
    static func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
                
            } catch {
                print("Error saving context \(error)")
            }
        }
    }
}

