//
//
// JournalCD
// 
// EntryTableViewCell.swift
//
// Created by Royal Blue Software
// 


import UIKit

class EntryTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    // MARK: - Helper Functions
    
    func configure(with entry: Entry) {
        titleLabel.text = entry.title
        dateLabel.text = DateFormatter.entryDate.string(from: entry.timeStamp ?? Date())
        timeLabel.text = DateFormatter.entryTime.string(from: entry.timeStamp ?? Date())
    }
}
