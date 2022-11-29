//
//  Baby+CoreDataProperties.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 29/11/22.
//
//

import Foundation
import CoreData


extension Baby {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Baby> {
        return NSFetchRequest<Baby>(entityName: "Baby")
    }
    
    @NSManaged public var birthDate: Date?
    @NSManaged public var name: String?
    @NSManaged public var photo: Data?
    @NSManaged public var id: UUID?
    @NSManaged public var milestones: NSSet?
    @NSManaged public var photos: NSSet?
    
}

// MARK: Generated accessors for milestones
extension Baby {
    
    @objc(addMilestonesObject:)
    @NSManaged public func addToMilestones(_ value: BabyMilestone)
    
    @objc(removeMilestonesObject:)
    @NSManaged public func removeFromMilestones(_ value: BabyMilestone)
    
    @objc(addMilestones:)
    @NSManaged public func addToMilestones(_ values: NSSet)
    
    @objc(removeMilestones:)
    @NSManaged public func removeFromMilestones(_ values: NSSet)
    
}

// MARK: Generated accessors for photos
extension Baby {
    
    @objc(addPhotosObject:)
    @NSManaged public func addToPhotos(_ value: BabyPhoto)
    
    @objc(removePhotosObject:)
    @NSManaged public func removeFromPhotos(_ value: BabyPhoto)
    
    @objc(addPhotos:)
    @NSManaged public func addToPhotos(_ values: NSSet)
    
    @objc(removePhotos:)
    @NSManaged public func removeFromPhotos(_ values: NSSet)
    
}

extension Baby : Identifiable {
    
    static func getAllBaby() -> [Baby] {
        let context = PersistenceController.viewContext
        let request = Baby.fetchRequest()
        request.shouldRefreshRefetchedObjects = true
        
        do {
            let babies = try context.fetch(request)
            if babies.isEmpty {
                return []
            }
            return babies
        } catch {
            print(error.localizedDescription)
        }
        
        return []
    }
    
}
