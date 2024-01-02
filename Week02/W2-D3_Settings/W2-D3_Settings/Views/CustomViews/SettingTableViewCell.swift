//
// SettingTableViewCell.swift
// W2-D3_Settings
//


import UIKit

// MARK: - Protocol


// Protocol Step 1: Declare the protocol
///  (Myles)
/*
 Protocol name *SettingCellDelegate*, can interact with class level objects
 */
protocol SettingCellDelegate: AnyObject {
    /// Declared *settingSwitchTapped* as the function required to conform to this protocol. Takes in a single parameter, cell, of type SettingTableViewCell
    func settingSwitchTapped(for cell: SettingTableViewCell)
    // You CANNOT include function definition (body) in the protocol...Tim won't let you micromanage
}

class SettingTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var settingNameLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    // MARK: - Properties
    
    // Protocol Step 2: Declare the delegate and its type.
    /// (assigning the Jenny)
    /*
     Whatever is assigned as the delegate will be the one to perfrom the protocol functionality
     */
    /// Marked as weak so as to not create a retain cycle. Marked as optional so that we can set the delegate later and not now
    weak var delegate: SettingCellDelegate?
    
    // MARK: - Actions
    
    @IBAction func settingSwitchToggled(_ sender: UISwitch) {
        // Protocol Step 5: Tell the delegate to perform the task
        /*
         example - (Jenny, please go clean the phones)
         */
        delegate?.settingSwitchTapped(for: self)
    }
    
    // MARK: - Helper Functions
    func updateViews(for setting: Setting) {
        settingNameLabel.text = setting.settingName
        settingImageView.image = setting.settingImage
        settingSwitch.isOn = setting.isOn
        
        // change the background based on switch toggle
        self.backgroundColor = setting.isOn ? .systemGreen : .white
        settingNameLabel.textColor = setting.isOn ? .white : .black // change the label text color
    }
}
