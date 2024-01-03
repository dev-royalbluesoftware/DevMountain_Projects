//
//
// AlarmCD
// 
// AlarmController.swift
//
// Created by Royal Blue Software
// 


import CoreData

class AlarmController: AlarmScheduler {
    
    // MARK: - Properties
    
    static let sharedInstance = AlarmController()
    var alarms: [Alarm] = []
    
    private lazy var fetchRequest: NSFetchRequest<Alarm> = {
        let request = NSFetchRequest<Alarm>(entityName: "Alarm")
        request.predicate = NSPredicate(value: true)
        
        return request
    }()
    
    // MARK: - Functions
    
    func createAlarm(withTitle title: String, fireDate: Date) {
        let newAlarm = Alarm(title: title, fireDate: fireDate)
        alarms.append(newAlarm)
        
        saveToPersistentStore()
        scheduleUserNotifications(for: newAlarm)
    }
    
    func fetchAlarm() {
        let alarms = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        self.alarms = alarms
    }
    
    func update(alarm: Alarm, newTitle: String, newFireDate: Date, isEnabled: Bool) {
        cancelUserNotifications(for: alarm)
        alarm.title = newTitle
        alarm.fireDate = newFireDate
        alarm.isEnabled = isEnabled
        
        if isEnabled {
            scheduleUserNotifications(for: alarm)
        }
        saveToPersistentStore()
    }
    
    func toggleIsEnabled(alarm: Alarm) {
        alarm.isEnabled.toggle()
        saveToPersistentStore()
        
        if alarm.isEnabled {
            scheduleUserNotifications(for: alarm)
            
        } else {
            cancelUserNotifications(for: alarm)
        }
    }
    
    func delete(alarm: Alarm) {
        CoreDataStack.context.delete(alarm)
        saveToPersistentStore()
        
        fetchAlarm()
        cancelUserNotifications(for: alarm)
    }
    
    // MARK: - Persistence
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
            
        } catch {
            print("Error saving")
        }
    }
}
