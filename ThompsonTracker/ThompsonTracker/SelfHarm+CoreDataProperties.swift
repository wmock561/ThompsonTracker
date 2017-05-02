//
//  SelfHarm+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/26/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension SelfHarm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SelfHarm> {
        return NSFetchRequest<SelfHarm>(entityName: "SelfHarm")
    }

    @NSManaged public var rawDate: NSDate
    @NSManaged public var value: Int64
    @NSManaged public var activity: Activity?

}
