//
// SchoolTaskController.swift
// SchoolTasks
//


import UIKit

class SchoolTaskController {
    
    // MARK: - Shared Instance
    
    static let sharedInstance = SchoolTaskController()
    
    // MARK: - Source of Truth
    
    var schoolTasks: [SchoolTask] = []
//    // sample data
//    {
//     let firstTask = SchoolTask(taskSubject: "Math", taskTitle: "Unit 4 Review", taskImage: "x.squareroot")
//     let secondTask = SchoolTask(taskSubject: "Art", taskTitle: "VanGough Essay", taskImage: "paintbrush.pointed")
//     let thirdTask = SchoolTask(taskSubject: "Pharmacology", taskTitle: "D.A.R.E. Homework", taskImage: "pills")
//     let fourthTask = SchoolTask(taskSubject: "Music", taskTitle: "Practice 15 min.", taskImage: "music.quarternote.3")
//
//     return [firstTask, secondTask, thirdTask, fourthTask]
//     }()
    
    // MARK: - CRUD Functions
    
    func createTask(subject: String, title: String, image: String) {
        let newTask = SchoolTask(taskSubject: subject, taskTitle: title, taskImage: image)
        schoolTasks.append(newTask)
        saveToPersistenceStore()
    }
    
    func deleteTask(task: SchoolTask) {
        guard let taskToDelete = schoolTasks.firstIndex(of: task) else { return }
        schoolTasks.remove(at: taskToDelete)
        saveToPersistenceStore()
    }
    
    // MARK: - Helper Functions
    
    func toggleIsCompleted(task: SchoolTask) {
        task.isComplete.toggle()
        saveToPersistenceStore()
    }
    
    // MARK: - Local Persistence
    
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("SchoolTask.json")
        
        return fileURL
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(schoolTasks)
            try data.write(to: createPersistenceStore())
            
        } catch {
            print("Error in \(#function): \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            schoolTasks = try JSONDecoder().decode([SchoolTask].self, from: data)
            
        } catch {
            print("Error in \(#function): \(error.localizedDescription) \n---\n \(error)")
        }
    }
}
