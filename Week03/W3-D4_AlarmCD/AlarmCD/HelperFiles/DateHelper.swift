//
//
// AlarmCD
// 
// DateHelper.swift
//
// Created by Royal Blue Software
// 


import Foundation

extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        return formatter.string(from: self)
    }
}
