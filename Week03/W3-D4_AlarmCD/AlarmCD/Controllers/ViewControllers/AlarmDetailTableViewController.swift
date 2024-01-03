//
//
// AlarmCD
// 
// AlarmDetailTableViewController.swift
//
// Created by Royal Blue Software
// 


import UIKit

class AlarmDetailTableViewController: UITableViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var alarmFireDatePicker: UIDatePicker!
    @IBOutlet weak var alarmTitleTextField: UITextField!
    @IBOutlet weak var alarmIsEnabledButton: UIButton!
    
    // MARK: - Properties
    var alarm: Alarm?
    var isAlarmOn: Bool = true
    
    // MARK: -  View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }

    // MARK: - Actions
    
    @IBAction func alarmIsEnabledButtonTapped(_ sender: Any) {
        if let alarm = alarm {
            AlarmController.sharedInstance.toggleIsEnabled(alarm: alarm)
            isAlarmOn = alarm.isEnabled
            
        } else {
            isAlarmOn = !isAlarmOn
        }
        
        designEnabledButton()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = alarmTitleTextField.text, !title.isEmpty else { return }
        
        if let alarm = alarm {
            AlarmController.sharedInstance.update(alarm: alarm, newTitle: title, newFireDate: alarmFireDatePicker.date, isEnabled: alarm.isEnabled)
            
        } else {
            AlarmController.sharedInstance.createAlarm(withTitle: title, fireDate: alarmFireDatePicker.date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helper Functions
    
    func updateView() {
        guard let alarm = alarm else { return }
        
        alarmTitleTextField.text = alarm.title
        alarmFireDatePicker.date = alarm.fireDate ?? Date()
        
        self.isAlarmOn = alarm.isEnabled
        
        designEnabledButton()
    }
    
    func designEnabledButton() {
        switch isAlarmOn {
        case true:
            alarmIsEnabledButton.backgroundColor = .white
            alarmIsEnabledButton.setTitle("Enabled", for: .normal)
            
        case false:
            alarmIsEnabledButton.backgroundColor = .darkGray
            alarmIsEnabledButton.setTitle("Disabled", for: .normal)
        }
    }
}
