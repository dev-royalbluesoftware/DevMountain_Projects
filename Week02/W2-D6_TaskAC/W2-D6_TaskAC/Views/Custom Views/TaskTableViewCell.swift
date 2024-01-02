//
// TaskTableViewCell.swift
// W2-D6_TaskAC
//


import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(cell: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    
    // MARK: - Properties
    var task: Task? {
        didSet {  // didSet will get triggered anytime task is assigned a value
            
            updateViews() // once task is set we what to update the views with the info.
        }
    }
    /*
     The `delegate` or *intern* for the protocol `TaskCompletionDelegate`
     - weak: We mark this method as weak to not create a retain cycle
     - optional: We do not want to set the value of the delegate here.
     */
    weak var delegate: TaskCompletionDelegate?
    
    // MARK: - Actions
    
    @IBAction func completionButtonTapped(_ sender: Any) {
        if let delegate = delegate {
            // This is the call to action for the delegate. Hey intern, go get me a coffee
            delegate.taskCellButtonTapped(cell: self)
        }
    }
    
    // MARK: - Helper Functions
    
    func updateViews() {
        guard let task = task else { return }
        
        taskNameLabel.text = task.name
        let checked = UIImage(named: "complete")
        let unchecked = UIImage(named: "incomplete")
        
        task.isComplete ? completionButton.setBackgroundImage(checked, for: .normal) : completionButton.setBackgroundImage(unchecked, for: .normal)
    }
}
