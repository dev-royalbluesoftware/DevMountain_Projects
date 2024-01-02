//
// MemberController.swift
// ProAthleteFinder
//


import UIKit

class MemberController {
    
    // MARK: - Properties
    
    
    
    static let family = [
        Member(name: "Monroe Einerson", photo: UIImage(named: "monroe"), clan: "Buell"),
        Member(name: "Julia Buell", photo: UIImage(named: "julia"), clan: "Buell"),
        Member(name: "Zachary Buell", photo: UIImage(named: "zachary"), clan: "Buell")
    ]
    
    static let nonFamily = [
        Member(name: "Tom Brady", photo: UIImage(named: "tommyb"), clan: "Non Buell"),
        Member(name: "Joe Montana", photo: UIImage(named: "joem"), clan: "Non Buell"),
        Member(name: "Yo Murphy", photo: UIImage(named: "yom"), clan: "Non Buell")
    ]
}
