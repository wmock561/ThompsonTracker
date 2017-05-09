//
//  StomachAche+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 5/9/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension StomachAche {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StomachAche> {
        return NSFetchRequest<StomachAche>(entityName: "StomachAche")
    }

    @NSManaged public var rawDate: NSDate
    @NSManaged public var value: Int64
    @NSManaged public var activity: Child?

}
