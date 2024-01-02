//
// JournalController.swift
// W2-D2_Journal
//


import Foundation

class JournalController {
    
    // MARK: - Properties
    
    // sharedInstance
    static let sharedInstance = JournalController()
    
    // source of truth
    var journals: [Journal] = []
    
    // MARK: - CRUD Functions
    
    func createJournalWith(title: String) {
        let newJournal = Journal(title: title)
        journals.append(newJournal)
        
        saveToPersistenceStore()
    }
        
    func delete(journal: Journal) {
        guard let index = journals.firstIndex(of: journal) else { return }
        journals.remove(at: index)
        
        saveToPersistenceStore()
    }
    
    func addEntryTo(journal: Journal, entry: Entry) {
        journal.entries.append(entry)
        
        saveToPersistenceStore()
    }
    
    func removeEntryFrom(journal: Journal, entry: Entry) {
        guard let index = journal.entries.firstIndex(of: entry) else { return }
        journal.entries.remove(at: index)
        
        saveToPersistenceStore()
    }
    
    
    // MARK: - Local Persistence
    
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Journals.json")
        
        return fileURL
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(journals)
            try data.write(to: createPersistenceStore())
            
        } catch {
            print("Error in \(#function): \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            journals = try JSONDecoder().decode([Journal].self, from: data)
            
        } catch {
            print("Error in \(#function): \(error.localizedDescription) \n---\n \(error)")
        }
    }

}
