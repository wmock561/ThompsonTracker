//
//  Activity+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/28/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension Activity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Activity> {
        return NSFetchRequest<Activity>(entityName: "Activity")
    }

    @NSManaged public var anxietyActivities: NSSet?
    @NSManaged public var attentionSpanActivities: NSSet?
    @NSManaged public var defianceActivities: NSSet?
    @NSManaged public var hyperActivities: NSSet?
    @NSManaged public var implusiveActivities: NSSet?
    @NSManaged public var irritibilityActivities: NSSet?
    @NSManaged public var repetitionActivities: NSSet?
    @NSManaged public var selfHarmActivities: NSSet?
    @NSManaged public var socialSkillsActivities: NSSet?
    @NSManaged public var speechActivities: NSSet?
    @NSManaged public var tantrumActivities: NSSet?
    @NSManaged public var ticsActivities: NSSet?
    @NSManaged public var sleepQualityActivities: NSSet?
    @NSManaged public var sleepLengthActivities: NSSet?

}

// MARK: Generated accessors for anxietyActivities
extension Activity {

    @objc(addAnxietyActivitiesObject:)
    @NSManaged public func addToAnxietyActivities(_ value: Anxiety)

    @objc(removeAnxietyActivitiesObject:)
    @NSManaged public func removeFromAnxietyActivities(_ value: Anxiety)

    @objc(addAnxietyActivities:)
    @NSManaged public func addToAnxietyActivities(_ values: NSSet)

    @objc(removeAnxietyActivities:)
    @NSManaged public func removeFromAnxietyActivities(_ values: NSSet)

}

// MARK: Generated accessors for attentionSpanActivities
extension Activity {

    @objc(addAttentionSpanActivitiesObject:)
    @NSManaged public func addToAttentionSpanActivities(_ value: AttentionSpan)

    @objc(removeAttentionSpanActivitiesObject:)
    @NSManaged public func removeFromAttentionSpanActivities(_ value: AttentionSpan)

    @objc(addAttentionSpanActivities:)
    @NSManaged public func addToAttentionSpanActivities(_ values: NSSet)

    @objc(removeAttentionSpanActivities:)
    @NSManaged public func removeFromAttentionSpanActivities(_ values: NSSet)

}

// MARK: Generated accessors for defianceActivities
extension Activity {

    @objc(addDefianceActivitiesObject:)
    @NSManaged public func addToDefianceActivities(_ value: Defiance)

    @objc(removeDefianceActivitiesObject:)
    @NSManaged public func removeFromDefianceActivities(_ value: Defiance)

    @objc(addDefianceActivities:)
    @NSManaged public func addToDefianceActivities(_ values: NSSet)

    @objc(removeDefianceActivities:)
    @NSManaged public func removeFromDefianceActivities(_ values: NSSet)

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

// MARK: Generated accessors for implusiveActivities
extension Activity {

    @objc(addImplusiveActivitiesObject:)
    @NSManaged public func addToImplusiveActivities(_ value: Implusivity)

    @objc(removeImplusiveActivitiesObject:)
    @NSManaged public func removeFromImplusiveActivities(_ value: Implusivity)

    @objc(addImplusiveActivities:)
    @NSManaged public func addToImplusiveActivities(_ values: NSSet)

    @objc(removeImplusiveActivities:)
    @NSManaged public func removeFromImplusiveActivities(_ values: NSSet)

}

// MARK: Generated accessors for irritibilityActivities
extension Activity {

    @objc(addIrritibilityActivitiesObject:)
    @NSManaged public func addToIrritibilityActivities(_ value: Irritability)

    @objc(removeIrritibilityActivitiesObject:)
    @NSManaged public func removeFromIrritibilityActivities(_ value: Irritability)

    @objc(addIrritibilityActivities:)
    @NSManaged public func addToIrritibilityActivities(_ values: NSSet)

    @objc(removeIrritibilityActivities:)
    @NSManaged public func removeFromIrritibilityActivities(_ values: NSSet)

}

// MARK: Generated accessors for repetitionActivities
extension Activity {

    @objc(addRepetitionActivitiesObject:)
    @NSManaged public func addToRepetitionActivities(_ value: Repetition)

    @objc(removeRepetitionActivitiesObject:)
    @NSManaged public func removeFromRepetitionActivities(_ value: Repetition)

    @objc(addRepetitionActivities:)
    @NSManaged public func addToRepetitionActivities(_ values: NSSet)

    @objc(removeRepetitionActivities:)
    @NSManaged public func removeFromRepetitionActivities(_ values: NSSet)

}

// MARK: Generated accessors for selfHarmActivities
extension Activity {

    @objc(addSelfHarmActivitiesObject:)
    @NSManaged public func addToSelfHarmActivities(_ value: SelfHarm)

    @objc(removeSelfHarmActivitiesObject:)
    @NSManaged public func removeFromSelfHarmActivities(_ value: SelfHarm)

    @objc(addSelfHarmActivities:)
    @NSManaged public func addToSelfHarmActivities(_ values: NSSet)

    @objc(removeSelfHarmActivities:)
    @NSManaged public func removeFromSelfHarmActivities(_ values: NSSet)

}

// MARK: Generated accessors for socialSkillsActivities
extension Activity {

    @objc(addSocialSkillsActivitiesObject:)
    @NSManaged public func addToSocialSkillsActivities(_ value: SocialSkills)

    @objc(removeSocialSkillsActivitiesObject:)
    @NSManaged public func removeFromSocialSkillsActivities(_ value: SocialSkills)

    @objc(addSocialSkillsActivities:)
    @NSManaged public func addToSocialSkillsActivities(_ values: NSSet)

    @objc(removeSocialSkillsActivities:)
    @NSManaged public func removeFromSocialSkillsActivities(_ values: NSSet)

}

// MARK: Generated accessors for speechActivities
extension Activity {

    @objc(addSpeechActivitiesObject:)
    @NSManaged public func addToSpeechActivities(_ value: Speech)

    @objc(removeSpeechActivitiesObject:)
    @NSManaged public func removeFromSpeechActivities(_ value: Speech)

    @objc(addSpeechActivities:)
    @NSManaged public func addToSpeechActivities(_ values: NSSet)

    @objc(removeSpeechActivities:)
    @NSManaged public func removeFromSpeechActivities(_ values: NSSet)

}

// MARK: Generated accessors for tantrumActivities
extension Activity {

    @objc(addTantrumActivitiesObject:)
    @NSManaged public func addToTantrumActivities(_ value: Tantrums)

    @objc(removeTantrumActivitiesObject:)
    @NSManaged public func removeFromTantrumActivities(_ value: Tantrums)

    @objc(addTantrumActivities:)
    @NSManaged public func addToTantrumActivities(_ values: NSSet)

    @objc(removeTantrumActivities:)
    @NSManaged public func removeFromTantrumActivities(_ values: NSSet)

}

// MARK: Generated accessors for ticsActivities
extension Activity {

    @objc(addTicsActivitiesObject:)
    @NSManaged public func addToTicsActivities(_ value: Tics)

    @objc(removeTicsActivitiesObject:)
    @NSManaged public func removeFromTicsActivities(_ value: Tics)

    @objc(addTicsActivities:)
    @NSManaged public func addToTicsActivities(_ values: NSSet)

    @objc(removeTicsActivities:)
    @NSManaged public func removeFromTicsActivities(_ values: NSSet)

}

// MARK: Generated accessors for sleepQualityActivities
extension Activity {

    @objc(addSleepQualityActivitiesObject:)
    @NSManaged public func addToSleepQualityActivities(_ value: SleepQuality)

    @objc(removeSleepQualityActivitiesObject:)
    @NSManaged public func removeFromSleepQualityActivities(_ value: SleepQuality)

    @objc(addSleepQualityActivities:)
    @NSManaged public func addToSleepQualityActivities(_ values: NSSet)

    @objc(removeSleepQualityActivities:)
    @NSManaged public func removeFromSleepQualityActivities(_ values: NSSet)

}

// MARK: Generated accessors for sleepLengthActivities
extension Activity {

    @objc(addSleepLengthActivitiesObject:)
    @NSManaged public func addToSleepLengthActivities(_ value: SleepLength)

    @objc(removeSleepLengthActivitiesObject:)
    @NSManaged public func removeFromSleepLengthActivities(_ value: SleepLength)

    @objc(addSleepLengthActivities:)
    @NSManaged public func addToSleepLengthActivities(_ values: NSSet)

    @objc(removeSleepLengthActivities:)
    @NSManaged public func removeFromSleepLengthActivities(_ values: NSSet)

}
