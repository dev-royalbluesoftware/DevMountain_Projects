//
// ItemListTableViewCell.swift
// W2-D5_Assessment-ShoppingList
//


import UIKit

// MARK: - Protocol

protocol ItemListCellDelegate: AnyObject {
    func isCompletedTapped(for cell: ItemListTableViewCell)
}

class ItemListTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    // MARK: - Properties
    
    var item: ListItem? {
        didSet {
            guard let item = item else { return }
            updateViews(for: item)
        }
    }
    
    weak var delegate: ItemListCellDelegate?
    
    // MARK: - Actions
    
    @IBAction func isCompleteButtonTapped(_ sender: Any) {
        delegate?.isCompletedTapped(for: self)
    }
    
    // MARK: - Helper Functions
    
    func updateViews(for listItem: ListItem) {
        itemTitleLabel.text = listItem.itemTitle
        
        if listItem.isComplete {
            let image = UIImage(systemName: "checkmark.rectangle.portrait")
            isCompleteButton.setBackgroundImage(image, for: .normal)
            isCompleteButton.tintColor = .systemIndigo
            itemTitleLabel.textColor = .systemIndigo
            
        } else {
            let image = UIImage(systemName: "square")
            isCompleteButton.setBackgroundImage(image, for: .normal)
            isCompleteButton.tintColor = .black
            itemTitleLabel.textColor = .black
        }
    }
}
