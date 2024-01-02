//
// SchoolTaskTableViewCell.swift
// SchoolTasks
//


import UIKit

// MARK: - Protocol

protocol SchoolTaskCellDelegate: AnyObject {
    func isCompletedTapped(for cell: SchoolTaskTableViewCell)
}

class SchoolTaskTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskIconImageView: UIImageView!
    @IBOutlet weak var isCompletedButton: UIButton!
    
    // MARK: - Properties
    
    var task: SchoolTask? {
        didSet {
            guard let task = task else { return }
            updateViews(for: task)
        }
    }
    
    weak var delegate: SchoolTaskCellDelegate?  // delegate landing pad
    
    // MARK: - Actions
    
    @IBAction func isCompletedButtonTapped(_ sender: Any) {
        delegate?.isCompletedTapped(for: self)
    }
    
    // MARK: - Helper Functions
    
    func updateViews(for schoolTask: SchoolTask) {
        taskIconImageView.image = UIImage(systemName: schoolTask.taskImage)
        taskIconImageView.tintColor = .systemIndigo
        
        taskTitleLabel.text = schoolTask.taskTitle
        subjectLabel.text = schoolTask.taskSubject
        
        if schoolTask.isComplete {
            let image = UIImage(systemName: "seal.fill")
            isCompletedButton.setBackgroundImage(image, for: .normal)
            isCompletedButton.tintColor = .systemGreen
            
        } else {
            let image = UIImage(systemName: "multiply.circle")
            isCompletedButton.setBackgroundImage(image, for: .normal)
            isCompletedButton.tintColor = .black
        }
    }
}
