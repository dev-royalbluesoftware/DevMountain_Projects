//
// SchoolTaskListTableViewController.swift
// SchoolTasks
//


import UIKit

class SchoolTaskListTableViewController: UITableViewController {
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SchoolTaskController.sharedInstance.loadFromPersistenceStore()
    }
    
    // MARK: - Actions
    
    @IBAction func addTaskAction(_ sender: Any) {
        // alert controller
        let alertController = UIAlertController(title: "Create New Task", message: "Fill out the information below to create a new task.", preferredStyle: .alert)
        alertController.addTextField() { textField in
            textField.placeholder = "What subject?"
        }
        alertController.addTextField() { textField in
            textField.placeholder = "Task goes here ..."
        }
        
        // actions
        let doneAction = UIAlertAction(title: "Add Task", style: .default) { _ in
            guard let subjectText = alertController.textFields?.first?.text, !subjectText.isEmpty,
                  let taskText = alertController.textFields?.last?.text, !taskText.isEmpty else { return }
            
            let image: String = { () -> String in
                switch subjectText.lowercased() {
                case "math":
                    return "x.squareroot"
                    
                case "music":
                    return "music.quarternote.3"
                    
                case "pharmacology":
                    return "pills"
                    
                case "computer science":
                    return "curlybraces"
                    
                case "history":
                    return "scroll"
                    
                case "art":
                    return "paintbrush.pointed"
                    
                default:
                    return "questionmark"
                }
            }()
            
            SchoolTaskController.sharedInstance.createTask(subject: subjectText, title: taskText, image: image)

            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - TableView Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SchoolTaskController.sharedInstance.schoolTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? SchoolTaskTableViewCell else { return UITableViewCell() }
        
        let schoolTask = SchoolTaskController.sharedInstance.schoolTasks[indexPath.row]
        
        cell.task = schoolTask
        cell.delegate = self
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let taskToDelete = SchoolTaskController.sharedInstance.schoolTasks[indexPath.row]
            SchoolTaskController.sharedInstance.deleteTask(task: taskToDelete)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

// MARK: - Extension SchoolTaskCell Delegate

extension SchoolTaskListTableViewController: SchoolTaskCellDelegate {
    func isCompletedTapped(for cell: SchoolTaskTableViewCell) {
        // capture the cell that was tapped
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        // toggle the schoolTask for the indexPath
        let schoolTask = SchoolTaskController.sharedInstance.schoolTasks[indexPath.row]
        SchoolTaskController.sharedInstance.toggleIsCompleted(task: schoolTask)

        cell.updateViews(for: schoolTask)
    }
}
