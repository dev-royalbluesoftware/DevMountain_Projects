//
// TaskDetailViewController.swift
// W2-D6_TaskAC
//


import UIKit

class TaskDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    
    // MARK: - Properties
    
    var task: Task? // landing pad
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        taskNotesTextView.layer.borderWidth = 1
    }
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    // make sure we have text
        guard let name = taskNameTextField.text, !name.isEmpty else { return }
        // if we have a task we need to unwrap it..
        if let task = task {
            // if there is a task, we need to call our CRUD function to update.
            TaskController.sharedInstance.updateTask(task: task, name: name, notes: taskNotesTextView.text)
        
        } else {
            // if there is no task we need to create a task
            TaskController.sharedInstance.createTaskWith(name: name, notes: taskNotesTextView.text)
        }
        // remove the top view off the navigation controller
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helper Functions
    
    func updateViews() {
        guard let task = task else { return }
        
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
    }
}
