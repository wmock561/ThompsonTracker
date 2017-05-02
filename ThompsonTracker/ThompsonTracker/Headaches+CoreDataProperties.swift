//
//  Headaches+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/28/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension Headaches {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Headaches> {
        return NSFetchRequest<Headaches>(entityName: "Headaches")
    }

    @NSManaged public var rawDate: NSDate
    @NSManaged public var value: Int64
    @NSManaged public var activity: Activity?

}
