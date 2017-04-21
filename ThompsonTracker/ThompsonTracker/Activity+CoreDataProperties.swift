//
//  Activity+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/20/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension Activity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Activity> {
        return NSFetchRequest<Activity>(entityName: "Activity")
    }

    @NSManaged public var hyperActivities: NSSet?

}

// MARK: Generated accessors for hyperActivities
extension Activity {

    @objc(addHyperActivitiesObject:)
    @NSManaged public func addToHyperActivities(_ value: Hyperactivity)

    @objc(removeHyperActivitiesObject:)
    @NSManaged public func removeFromHyperActivities(_ value: Hyperactivity)

    @objc(addHyperActivities:)
    @NSManaged public func addToHyperActivities(_ values: NSSet)

    @objc(removeHyperActivities:)
    @NSManaged public func removeFromHyperActivities(_ values: NSSet)

}
