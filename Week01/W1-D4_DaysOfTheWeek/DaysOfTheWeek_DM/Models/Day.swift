//
// Day.swift
// W1-D4_daysOfTheWeek
//


import Foundation

class Day {
    
    // MARK: - Properties
    
    /// Property of the Day object that will hold a String (the name of the day)
    let name: String
    /// Property of the Day object that will hold a String (the origin description of the day)
    let origin: String
    
    
    // MARK: - Initializer
    /**
     Initializes a Day object
     
     - Parameters:
        - name: String value for the Day's *name* property
        - origin: String value for the Day's *origin* property
     
     This *memberwise initializer* will set the values of the name and origin parameters to the name and origin properties of a Day object
     */
    
    init(name: String, origin: String) {
        self.name = name
        self.origin = origin
    }
}
