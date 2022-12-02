//
//  BabyMilestoneNote+CoreDataProperties.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 29/11/22.
//
//

import Foundation
import CoreData


extension BabyMilestoneNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BabyMilestoneNote> {
        return NSFetchRequest<BabyMilestoneNote>(entityName: "BabyMilestoneNote")
    }

    @NSManaged public var body: String?
    @NSManaged public var isImportant: Bool
    @NSManaged public var modifiedDate: Date?
    @NSManaged public var title: String?
    @NSManaged public var id: UUID?
    @NSManaged public var milestone: BabyMilestone?

}

extension BabyMilestoneNote : Identifiable {

}
