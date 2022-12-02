//
//  BabyPhoto+CoreDataProperties.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 30/11/22.
//
//

import Foundation
import CoreData


extension BabyPhoto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BabyPhoto> {
        return NSFetchRequest<BabyPhoto>(entityName: "BabyPhoto")
    }

    @NSManaged public var createdDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var milestoneID: Int16
    @NSManaged public var photo: Data?
    @NSManaged public var stimulusID: Int16
    @NSManaged public var baby: Baby?

}

extension BabyPhoto : Identifiable {

}
