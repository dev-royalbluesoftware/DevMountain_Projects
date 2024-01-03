//
//
// AlarmCD
// 
// AlarmTableViewCell.swift
//
// Created by Royal Blue Software
// 


import UIKit

// MARK: - Protocol

protocol AlarmTableViewCellDelegate: AnyObject {
    func alarmWasToggled(sender: AlarmTableViewCell)
}

class AlarmTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var alarmTitleLabel: UILabel!
    @IBOutlet weak var alarmFireDateLabel: UILabel!
    @IBOutlet weak var isEnabledSwitch: UISwitch!
    
    // MARK: - Properties
    
    weak var delegate: AlarmTableViewCellDelegate?
    
    // MARK: - Actions
    
    @IBAction func isEnabledSwitchToggled(_ sender: Any) {
        delegate?.alarmWasToggled(sender: self)
    }
    
    // MARK: - Helper Functions
    
    func updateViews(alarm: Alarm) {
        alarmTitleLabel.text = alarm.title
        alarmFireDateLabel.text = alarm.fireDate!.stringValue()
        isEnabledSwitch.isOn = alarm.isEnabled
    }
}
