//
//
// JournalCD
// 
// DateFormatter+Extras.swift
//
// Created by Royal Blue Software
// 


import Foundation

extension DateFormatter {
    static let entryDate: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        return dateFormatter
    }()
    
    static let entryTime: DateFormatter = {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        
        return timeFormatter
    }()
}
