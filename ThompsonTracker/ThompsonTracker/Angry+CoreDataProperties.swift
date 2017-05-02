//
//  Angry+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/28/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension Angry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Angry> {
        return NSFetchRequest<Angry>(entityName: "Angry")
    }

    @NSManaged public var rawDate: NSDate
    @NSManaged public var value: Int64
    @NSManaged public var activity: Activity?

}
