//
// SettingListTableViewController.swift
// W2-D3_Settings
//


import UIKit

class SettingListTableViewController: UITableViewController {
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - TableView Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SettingController.sharedInstance.settings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingTableViewCell else { return UITableViewCell()}  // optionally cast as custom cell
        
        let setting = SettingController.sharedInstance.settings[indexPath.row]
        cell.updateViews(for: setting)
        
        // Protocol Step 3: Assigning the delegate
        /*
         Assigning self(SettingsListTableViewController) as the delegate(employee) of the cell(manager)
         */
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 7
    }
}

// MARK: - Extension - SettingCell Delegate

// Protocol Step 4: Conform to delegate
/*
    Using an extension, conform SettingListTableViewController to SettingCellDelegate
    (click fix to add required functionality)
    - Jenny -
 */
extension SettingListTableViewController: SettingCellDelegate {
    func settingSwitchTapped(for cell: SettingTableViewCell) {
        // Get the indexPath for the cell that was selected
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        // Grab the setting from the SOT at the index of the selected cell
        let setting = SettingController.sharedInstance.settings[indexPath.row]
        // Call .toggleIsOn function to toggle the isOn property of the passed in setting
        SettingController.sharedInstance.toggleIsOn(for: setting)
        // Call the updateViews function on our cell to update the view and reflect the newly changed isOn property
        cell.updateViews(for: setting)
    }
}
