//
//
// JournalCD
// 
// Entry+Convenience.swift
//
// Created by Royal Blue Software
// 


import CoreData

extension Entry {
    @discardableResult convenience init(title:String, timeStamp: Date = Date(), bodyText: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.timeStamp = timeStamp
        self.bodyText = bodyText
    }
}
