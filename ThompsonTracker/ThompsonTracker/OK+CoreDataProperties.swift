//
//  OK+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/28/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension OK {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OK> {
        return NSFetchRequest<OK>(entityName: "OK")
    }

    @NSManaged public var rawDate: NSDate
    @NSManaged public var value: Int64
    @NSManaged public var activity: Activity?

}
