//
//  BabyPhoto+CoreDataProperties.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 25/11/22.
//
//

import Foundation
import CoreData


extension BabyPhoto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BabyPhoto> {
        return NSFetchRequest<BabyPhoto>(entityName: "BabyPhoto")
    }

    @NSManaged public var photo: Data?
    @NSManaged public var createdDate: Date?
    @NSManaged public var milestoneID: String?
    @NSManaged public var stimulusID: String?
    @NSManaged public var baby: Baby?

}

extension BabyPhoto : Identifiable {

}
