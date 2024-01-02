//
// TaskDetailViewController.swift
// W2-D3_Task
//


import UIKit

class TaskDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    // MARK: - Properties
    
    var task: Task? // landing pad
    var date: Date? // optional date value will only get assigned if date is chosen
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let name = taskNameTextField.text, !name.isEmpty,
              let notes = taskNotesTextView.text, !notes.isEmpty else { return }
        
        if let task = task {
             // update the task from selection
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, dueDate: date)
            
        } else {
            TaskController.sharedInstance.createTaskWith(name: name, notes: notes, dueDate: date)
        }
        navigationController?.popViewController(animated: true) // removes topView
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: UIDatePicker) {
        self.date = taskDueDatePicker.date
    }
    
    // MARK: - Helper Functions
    
    func updateViews() {
        guard let task = task else { return }
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()
        self.date = task.dueDate
    }
}
