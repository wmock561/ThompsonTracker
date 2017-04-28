//
//  SleepLength+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/28/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension SleepLength {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SleepLength> {
        return NSFetchRequest<SleepLength>(entityName: "SleepLength")
    }

    @NSManaged public var rawDate: NSDate
    @NSManaged public var value: Float
    @NSManaged public var activity: Activity?

}
