//
//
// W3-D2-3_TaskCoreData
// 
// TaskController.swift
//
// Created by Royal Blue Software
// 


import CoreData

class TaskController {
    
    // MARK: - Properties
    
    static let sharedInstance = TaskController()
    
    // MARK: - Source of Truth
    
    var tasks: [Task] = []
    
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        
        return request
    }()
    
    // MARK: - Functions
    
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let newTask = Task(name: name, notes: notes, dueDate: dueDate)
        tasks.append(newTask)
        
        CoreDataStack.saveContext()
    }
    
    func fetchTasks() {
        let tasks = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        self.tasks = tasks
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        
        CoreDataStack.saveContext()
    }
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        
        CoreDataStack.saveContext()
    }
    
    func deleteTask(task: Task) {
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks.remove(at: index)
        
        CoreDataStack.container.viewContext.delete(task)
        CoreDataStack.saveContext()
    }
}
