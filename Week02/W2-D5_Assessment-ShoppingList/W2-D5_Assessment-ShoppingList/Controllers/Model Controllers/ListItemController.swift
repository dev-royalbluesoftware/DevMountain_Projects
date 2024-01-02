//
// ListItemController.swift
// W2-D5_Assessment-ShoppingList
//


import Foundation

class ListItemController {
    
    // MARK: - Properties
    
    static let sharedInstance = ListItemController()
    var listItems: [ListItem] = []
    
    // MARK: - CRUD Functions
    
    func createItem(itemTitle: String) {
        let newItem = ListItem(itemTitle: itemTitle)
        listItems.append(newItem)
        
        saveToPersistenceStore()
    }
    
    func deleteItem(item: ListItem) {
        guard let itemToDelete = listItems.firstIndex(of: item) else { return }
        listItems.remove(at: itemToDelete)
        
        saveToPersistenceStore()
    }
    
    // MARK: - Helper Functions
    
    func toggleIsComplete(item: ListItem) {
        item.isComplete.toggle()
        
        saveToPersistenceStore()
    }
    
    // MARK: - Local Persistence
    
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("ListItems.json")
        
        return fileURL
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(listItems)
            try data.write(to: createPersistenceStore())
            
        } catch {
            print("Error in \(#function): \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            listItems = try JSONDecoder().decode([ListItem].self, from: data)
            
        } catch {
            print("Error in \(#function): \(error.localizedDescription) \n---\n \(error)")
        }
    }
}
