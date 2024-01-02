//
// TaskController.swift
// W2-D6_TaskAC
//


import Foundation

class TaskController {
    
    // MARK: - Properties
    
    static let sharedInstance = TaskController()
    // source of truth
    var tasks: [Task] = []
    
    // MARK: - CRUD Functions
    
    func createTaskWith(name: String, notes: String?) {
        let newTask = Task(name: name, notes: notes)
        tasks.append(newTask)
        
        saveToPersistenceStore(tasks: tasks)
    }
    
    func updateTask(task: Task, name: String, notes: String?) {
        task.name = name
        task.notes = notes
        
        saveToPersistenceStore(tasks: tasks)
    }
    
    func deleteTask(task: Task) {
        guard let index = tasks.firstIndex(of: task) else {return}
        tasks.remove(at: index)
       
        saveToPersistenceStore(tasks: tasks)
    }
    
    // MARK: - Helper Functions
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        
        saveToPersistenceStore(tasks: tasks)
    }
    
    // MARK: - Local Persistence
    
    func createPersistenceStore() -> URL {
        // returns the URL of the file location
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("TaskAC.json")
        
        return fileURL
    }
    
    func saveToPersistenceStore(tasks: [Task]) {
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: createPersistenceStore())
            
        } catch {
            print("Error in \(#function): \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            tasks = try JSONDecoder().decode([Task].self, from: data)
            
        } catch {
            print("Error in \(#function): \(error.localizedDescription) \n---\n \(error)")
        }
    }
}
