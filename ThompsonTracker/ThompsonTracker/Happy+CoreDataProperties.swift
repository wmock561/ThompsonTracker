//
//  Happy+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 5/9/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension Happy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Happy> {
        return NSFetchRequest<Happy>(entityName: "Happy")
    }

    @NSManaged public var rawDate: NSDate
    @NSManaged public var value: Int64
    @NSManaged public var activity: Child?

}
