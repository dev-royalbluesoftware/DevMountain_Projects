//
// Setting.swift
// W2-D3_Settings
//


import UIKit

class Setting {
    
    // MARK: - Properties
    
    let settingName: String
    let settingImage: UIImage
    var isOn: Bool
    
    // memberwise initializer
    init(settingName: String, settingImage: UIImage, isOn: Bool) {
        self.settingName = settingName
        self.settingImage = settingImage
        self.isOn = isOn
    }
}
