//
//
// JournalCD
// 
// EntryController.swift
//
// Created by Royal Blue Software
// 


import CoreData

class EntryController {
    
    // MARK: - Properties
    
    static let sharedInstance = EntryController()
    var entries: [Entry] = [] // source of truth
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        
        return request
    }()

    // MARK: - Functions
    
    func createEntry(title: String, bodyOfText: String) {
        let entry = Entry(title: title, bodyText: bodyOfText)
        entries.append(entry)
        
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        self.entries = entries
    }
    
    func updateEntry(_ entry: Entry) {
        CoreDataStack.saveContext()
    }
    
    func deleteEntry(_ entry: Entry) {
        // black diamond
        guard let index = entries.firstIndex(of: entry) else { return }
        entries.remove(at: index)
        
        CoreDataStack.context.delete(entry)
        CoreDataStack.saveContext()
    }
}
