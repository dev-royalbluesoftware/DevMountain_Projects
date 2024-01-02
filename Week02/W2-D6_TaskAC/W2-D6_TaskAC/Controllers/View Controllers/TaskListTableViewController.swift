//
// TaskListTableViewController.swift
// W2-D6_TaskAC
//


import UIKit

class TaskListTableViewController: UITableViewController {
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskController.sharedInstance.loadFromPersistenceStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData() // reloads the rows and sections of the tableView
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedInstance.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        let task = TaskController.sharedInstance.tasks[indexPath.row]
        
        cell.delegate = self
        cell.task = task
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskController.sharedInstance.tasks[indexPath.row]
            TaskController.sharedInstance.deleteTask(task: task)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: - Actions

    @IBAction func addTaskButtonTapped(_ sender: Any) {
        doubleCheckPopup()
    }
    
    // MARK: - Helper Functions
    
    func doubleCheckPopup() {
        if TaskController.sharedInstance.tasks.count != 0 {
            let alertController = UIAlertController(title: "Are you sure you can add any more tasks?", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
                if let taskDetailVC = self.storyboard?.instantiateViewController(identifier: "taskDetailVC") {
                    self.navigationController?.pushViewController(taskDetailVC, animated: true)
                }
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
        
        } else {
            if let taskDetailVC = self.storyboard?.instantiateViewController(identifier: "taskDetailVC") {
                self.navigationController?.pushViewController(taskDetailVC, animated: true)
            }
        }
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? TaskDetailViewController else { return }
            let task = TaskController.sharedInstance.tasks[indexPath.row]
            destinationVC.task = task
        }
    }
}

// MARK: - Extension TaskCompletion Delegate

extension TaskListTableViewController: TaskCompletionDelegate {
    func taskCellButtonTapped(cell: TaskTableViewCell) {
        guard let task = cell.task else { return }
        TaskController.sharedInstance.toggleIsComplete(task: task)
        cell.updateViews()
    }
}
