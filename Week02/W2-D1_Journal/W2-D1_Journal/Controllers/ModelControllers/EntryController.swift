//
// EntryController.swift
// W2-D1_Journal
//


import Foundation

class EntryController {
    
    // MARK: - Properties
    
    // Shared Instance
    static let sharedInstance = EntryController()
    // Source of Truth (SoT)
    var entries: [Entry] = []
    
    // MARK: - CRUD Functions
    
    func createEntryWith(title: String, body: String) {
        let newEntry = Entry(title: title, body: body)
        entries.append(newEntry)
        
        saveToPersistenceStore()
    }
    
    func delete(entry: Entry) {
        guard let index = entries.firstIndex(of: entry) else { return }
        entries.remove(at: index)
        
        saveToPersistenceStore()
    }
    
    // MARK: - Local Persistence
    
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Journal.json")
        
        return fileURL
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(entries)
            try data.write(to: createPersistenceStore())
            
        } catch {
            print("Error in \(#function): \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            entries = try JSONDecoder().decode([Entry].self, from: data)
            
        } catch {
            print("Error in \(#function): \(error.localizedDescription) \n---\n \(error)")
        }
    }
}
