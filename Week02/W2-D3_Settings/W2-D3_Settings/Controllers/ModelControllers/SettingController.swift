//
// SettingController.swift
// W2-D3_Settings
//


import UIKit

class SettingController {
    
    // MARK: - Shared Instance
    
    static let sharedInstance = SettingController()
    
    // MARK: - Properties
    
    let settings: [Setting] = {
        let iTunes = Setting(settingName: "iTunes", settingImage: #imageLiteral(resourceName: "iTunes"), isOn: false)
        let appStore = Setting(settingName: "App Store", settingImage: #imageLiteral(resourceName: "appStore"), isOn: false)
        let books = Setting(settingName: "Books", settingImage: UIImage(imageLiteralResourceName: "iBooks"), isOn: true)
       
        return [iTunes, appStore, books]
    }()
    
    // MARK: - Helper Function
    
    func toggleIsOn(for setting: Setting) {
        /* 1 method: set property to opposite
            setting.isOn = !setting.isOn
        */
        setting.isOn.toggle()
    }
}
