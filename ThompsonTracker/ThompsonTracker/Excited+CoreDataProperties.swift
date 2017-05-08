//
//  Excited+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 5/1/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension Excited {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Excited> {
        return NSFetchRequest<Excited>(entityName: "Excited")
    }

    @NSManaged public var rawDate: NSDate
    @NSManaged public var value: Int64
    @NSManaged public var activity: Activity?

}