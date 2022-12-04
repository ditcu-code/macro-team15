//
//  BabyMilestone+CoreDataProperties.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 30/11/22.
//
//

import Foundation
import CoreData

extension BabyMilestone {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<BabyMilestone> {
        return NSFetchRequest<BabyMilestone>(entityName: "BabyMilestone")
    }
    
    @NSManaged public var checkedDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var isChecked: Bool
    @NSManaged public var milestoneID: Int16
    @NSManaged public var month: Int16
    @NSManaged public var baby: Baby?
    @NSManaged public var notes: NSSet?
    
}

// MARK: Generated accessors for notes
extension BabyMilestone {
    
    @objc(addNotesObject:)
    @NSManaged public func addToNotes(_ value: BabyMilestoneNote)
    
    @objc(removeNotesObject:)
    @NSManaged public func removeFromNotes(_ value: BabyMilestoneNote)
    
    @objc(addNotes:)
    @NSManaged public func addToNotes(_ values: NSSet)
    
    @objc(removeNotes:)
    @NSManaged public func removeFromNotes(_ values: NSSet)
    
}

extension BabyMilestone : Identifiable {
    
    static func getAll() -> [BabyMilestone] {
        let context = PersistenceController.viewContext
        let request = BabyMilestone.fetchRequest()
        request.shouldRefreshRefetchedObjects = true
        
        do {
            let babyMilestones = try context.fetch(request)
            if babyMilestones.isEmpty {
                return []
            }
            return babyMilestones
        } catch {
            print(error.localizedDescription)
        }
        
        return []
    }
    
    static func getSpecificMilestone(with milestoneID: Int16?) -> BabyMilestone? {
        let context = PersistenceController.viewContext
        guard let milestoneID = milestoneID else { return nil }
        let request = BabyMilestone.fetchRequest()
        request.predicate = NSPredicate(format: "milestoneID == %@", milestoneID.description)
        guard let items = try? context.fetch(request) else { return nil }
        return items.first
    }
    
    static func getCompletedMilestone(with month: Int16?) -> [BabyMilestone]? {
        let context = PersistenceController.viewContext
        guard let month = month else { return nil }
        let request = BabyMilestone.fetchRequest()
        request.predicate = NSPredicate(format: "month == %@", month.description)
        request.predicate = NSPredicate(format: "isChecked == true")
        guard let items = try? context.fetch(request) else { return nil }
        return items
    }
    
    static func getNotesByMilestonePeriod(month: Int16?) -> [BabyMilestone]? {
        let context = PersistenceController.viewContext
        guard let month = month else { return nil }
        let request = BabyMilestone.fetchRequest()
        request.predicate = NSPredicate(format: "month == %@", month.description)
        guard let items = try? context.fetch(request) else { return nil }
        return items
    }
    
}
