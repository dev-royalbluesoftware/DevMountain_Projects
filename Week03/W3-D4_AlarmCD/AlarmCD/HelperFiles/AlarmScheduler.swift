//
//
// AlarmCD
// 
// AlarmScheduler.swift
//
// Created by Royal Blue Software
// 


import UserNotifications

// MARK: - Protocol

protocol AlarmScheduler: AnyObject {
    func scheduleUserNotifications(for alarm: Alarm)
    func cancelUserNotifications(for alarm: Alarm)
}

// MARK: - Extension

extension AlarmScheduler {
    
    func scheduleUserNotifications(for alarm: Alarm) {
        guard let fireDate = alarm.fireDate,
              let uuid = alarm.uuidString else { return }
        
        let content = UNMutableNotificationContent()
        content.title = "ALARM"
        content.body = "Now is time for \(alarm.title ?? "alarm.")."
        
        let dateComponent = Calendar.current.dateComponents([.hour, .minute], from: fireDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        let request = UNNotificationRequest(identifier: "\(uuid)", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Unable to add notification request: \(error.localizedDescription)")
            }
        }
    }
    
    func cancelUserNotifications(for alarm: Alarm) {
        guard let uuid = alarm.uuidString else { return }
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [uuid])
    }
}
