//
//
// W3-D2-3_TaskCoreData
// 
// TaskDetailViewController.swift
//
// Created by Royal Blue Software
// 


import UIKit

class TaskDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    
    // MARK: - Properties
    
    var task: Task?
    var date: Date?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }

    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func dueDatePickerChanged(_ sender: UIDatePicker) {
    }
    
    // MARK: - Helper Functions
    
    func updateViews() {
        guard let task = task else { return }
        
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()
    }
}
