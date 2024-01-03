//
//
// W3-D2-3_TaskCoreData
// 
// TaskTableViewCell.swift
//
// Created by Royal Blue Software
// 


import UIKit

// MARK: - Protocol

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {

   // MARK: - Outlets
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskCompletionButton: UIButton!
    
    // MARK: - Properties
    
    var task: Task? {
        didSet {
            updateView()
        }
    }
    
    weak var delegate: TaskCompletionDelegate?
    
    // MARK: - Actions
    
    @IBAction func completionButtonTapped(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.taskCellButtonTapped(self)
        }
    }
    
    // MARK: - Helper Functions
    
    func updateView() {
        guard let task = task else { return }
        taskNameLabel.text = task.name
        
        let image = task.isComplete ? UIImage(named: "complete") : UIImage(named: "incomplete")
        
        taskCompletionButton.setImage(image, for: .normal)
    }
}
