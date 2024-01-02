//
// EntryContoller.swift
// W2-D2_Journal
//


import Foundation

class EntryController {
    
    // MARK: - CRUD Functions
    
    static func createEntryWith(title: String, body: String, journal: Journal) {
        let newEntry = Entry(title: title, body: body)
        
        JournalController.sharedInstance.addEntryTo(journal: journal, entry: newEntry)
    }
    
    static func update(entry: Entry, title: String, body: String) {
        entry.title = title
        entry.body = body
        
        JournalController.sharedInstance.saveToPersistenceStore()
    }
    
    static func deleteEntry(entry: Entry, journal: Journal) {
        JournalController.sharedInstance.removeEntryFrom(journal: journal, entry: entry)
    }
}
