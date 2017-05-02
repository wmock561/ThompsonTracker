//
//  SocialSkills+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/26/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension SocialSkills {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SocialSkills> {
        return NSFetchRequest<SocialSkills>(entityName: "SocialSkills")
    }

    @NSManaged public var rawDate: NSDate
    @NSManaged public var value: Int64
    @NSManaged public var activity: Activity?

}
