//
//  Activity+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/26/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension Activity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Activity> {
        return NSFetchRequest<Activity>(entityName: "Activity")
    }

    @NSManaged public var hyperActivities: NSSet?
    @NSManaged public var implusiveActivities: Implusivity?
    @NSManaged public var repetitionActivities: Repetition?
    @NSManaged public var anxietyActivities: Anxiety?
    @NSManaged public var attentionSpanActivities: AttentionSpan?
    @NSManaged public var irritibilityActivities: Irritability?
    @NSManaged public var selfHarmActivities: SelfHarm?
    @NSManaged public var ticsActivities: Tics?
    @NSManaged public var defianceActivities: Defiance?
    @NSManaged public var socialSkillsActivities: SocialSkills?
    @NSManaged public var speechActivities: Speech?
    @NSManaged public var tantrumActivities: Tantrums?

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
