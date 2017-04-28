//
//  RespiratoryIssues+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/28/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension RespiratoryIssues {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RespiratoryIssues> {
        return NSFetchRequest<RespiratoryIssues>(entityName: "RespiratoryIssues")
    }

    @NSManaged public var rawDate: NSDate
    @NSManaged public var value: Int64
    @NSManaged public var activity: Activity?

}
