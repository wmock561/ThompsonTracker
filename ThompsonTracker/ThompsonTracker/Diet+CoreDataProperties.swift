//
//  Diet+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 5/9/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension Diet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Diet> {
        return NSFetchRequest<Diet>(entityName: "Diet")
    }

    @NSManaged public var rawDate: NSDate
    @NSManaged public var value: Int64
    @NSManaged public var activity: Child?

}
