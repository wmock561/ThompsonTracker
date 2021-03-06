//
//  Child+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 5/9/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension Child {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Child> {
        return NSFetchRequest<Child>(entityName: "Child")
    }

    @NSManaged public var birthDate: NSDate?
    @NSManaged public var doctorsName: String?
    @NSManaged public var firstName: String?
    @NSManaged public var hospital: String?
    @NSManaged public var lastName: String?
    @NSManaged public var nickName: String?
    @NSManaged public var photo: NSData?
    @NSManaged public var angryActivities: NSSet?
    @NSManaged public var anxietyActivities: NSSet?
    @NSManaged public var attentionSpanActivities: NSSet?
    @NSManaged public var calmActivities: NSSet?
    @NSManaged public var defianceActivities: NSSet?
    @NSManaged public var diarrheaActivities: NSSet?
    @NSManaged public var dietActivities: NSSet?
    @NSManaged public var excitedActivities: NSSet?
    @NSManaged public var happyActivities: NSSet?
    @NSManaged public var headacheActivities: NSSet?
    @NSManaged public var hyperActivities: NSSet?
    @NSManaged public var implusiveActivities: NSSet?
    @NSManaged public var irritibilityActivities: NSSet?
    @NSManaged public var repetitionActivities: NSSet?
    @NSManaged public var respritoryActivities: NSSet?
    @NSManaged public var sadActivities: NSSet?
    @NSManaged public var selfHarmActivities: NSSet?
    @NSManaged public var sleepLengthActivities: NSSet?
    @NSManaged public var sleepQualityActivities: NSSet?
    @NSManaged public var stomachAcheActivities: NSSet?
    @NSManaged public var tantrumActivities: NSSet?
    @NSManaged public var tremorActivities: NSSet?

}

// MARK: Generated accessors for angryActivities
extension Child {

    @objc(addAngryActivitiesObject:)
    @NSManaged public func addToAngryActivities(_ value: Angry)

    @objc(removeAngryActivitiesObject:)
    @NSManaged public func removeFromAngryActivities(_ value: Angry)

    @objc(addAngryActivities:)
    @NSManaged public func addToAngryActivities(_ values: NSSet)

    @objc(removeAngryActivities:)
    @NSManaged public func removeFromAngryActivities(_ values: NSSet)

}

// MARK: Generated accessors for anxietyActivities
extension Child {

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
extension Child {

    @objc(addAttentionSpanActivitiesObject:)
    @NSManaged public func addToAttentionSpanActivities(_ value: AttentionSpan)

    @objc(removeAttentionSpanActivitiesObject:)
    @NSManaged public func removeFromAttentionSpanActivities(_ value: AttentionSpan)

    @objc(addAttentionSpanActivities:)
    @NSManaged public func addToAttentionSpanActivities(_ values: NSSet)

    @objc(removeAttentionSpanActivities:)
    @NSManaged public func removeFromAttentionSpanActivities(_ values: NSSet)

}

// MARK: Generated accessors for calmActivities
extension Child {

    @objc(addCalmActivitiesObject:)
    @NSManaged public func addToCalmActivities(_ value: Calm)

    @objc(removeCalmActivitiesObject:)
    @NSManaged public func removeFromCalmActivities(_ value: Calm)

    @objc(addCalmActivities:)
    @NSManaged public func addToCalmActivities(_ values: NSSet)

    @objc(removeCalmActivities:)
    @NSManaged public func removeFromCalmActivities(_ values: NSSet)

}

// MARK: Generated accessors for defianceActivities
extension Child {

    @objc(addDefianceActivitiesObject:)
    @NSManaged public func addToDefianceActivities(_ value: Defiance)

    @objc(removeDefianceActivitiesObject:)
    @NSManaged public func removeFromDefianceActivities(_ value: Defiance)

    @objc(addDefianceActivities:)
    @NSManaged public func addToDefianceActivities(_ values: NSSet)

    @objc(removeDefianceActivities:)
    @NSManaged public func removeFromDefianceActivities(_ values: NSSet)

}

// MARK: Generated accessors for diarrheaActivities
extension Child {

    @objc(addDiarrheaActivitiesObject:)
    @NSManaged public func addToDiarrheaActivities(_ value: Diarrhea)

    @objc(removeDiarrheaActivitiesObject:)
    @NSManaged public func removeFromDiarrheaActivities(_ value: Diarrhea)

    @objc(addDiarrheaActivities:)
    @NSManaged public func addToDiarrheaActivities(_ values: NSSet)

    @objc(removeDiarrheaActivities:)
    @NSManaged public func removeFromDiarrheaActivities(_ values: NSSet)

}

// MARK: Generated accessors for dietActivities
extension Child {

    @objc(addDietActivitiesObject:)
    @NSManaged public func addToDietActivities(_ value: Diet)

    @objc(removeDietActivitiesObject:)
    @NSManaged public func removeFromDietActivities(_ value: Diet)

    @objc(addDietActivities:)
    @NSManaged public func addToDietActivities(_ values: NSSet)

    @objc(removeDietActivities:)
    @NSManaged public func removeFromDietActivities(_ values: NSSet)

}

// MARK: Generated accessors for excitedActivities
extension Child {

    @objc(addExcitedActivitiesObject:)
    @NSManaged public func addToExcitedActivities(_ value: Excited)

    @objc(removeExcitedActivitiesObject:)
    @NSManaged public func removeFromExcitedActivities(_ value: Excited)

    @objc(addExcitedActivities:)
    @NSManaged public func addToExcitedActivities(_ values: NSSet)

    @objc(removeExcitedActivities:)
    @NSManaged public func removeFromExcitedActivities(_ values: NSSet)

}

// MARK: Generated accessors for happyActivities
extension Child {

    @objc(addHappyActivitiesObject:)
    @NSManaged public func addToHappyActivities(_ value: Happy)

    @objc(removeHappyActivitiesObject:)
    @NSManaged public func removeFromHappyActivities(_ value: Happy)

    @objc(addHappyActivities:)
    @NSManaged public func addToHappyActivities(_ values: NSSet)

    @objc(removeHappyActivities:)
    @NSManaged public func removeFromHappyActivities(_ values: NSSet)

}

// MARK: Generated accessors for headacheActivities
extension Child {

    @objc(addHeadacheActivitiesObject:)
    @NSManaged public func addToHeadacheActivities(_ value: Headaches)

    @objc(removeHeadacheActivitiesObject:)
    @NSManaged public func removeFromHeadacheActivities(_ value: Headaches)

    @objc(addHeadacheActivities:)
    @NSManaged public func addToHeadacheActivities(_ values: NSSet)

    @objc(removeHeadacheActivities:)
    @NSManaged public func removeFromHeadacheActivities(_ values: NSSet)

}

// MARK: Generated accessors for hyperActivities
extension Child {

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
extension Child {

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
extension Child {

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
extension Child {

    @objc(addRepetitionActivitiesObject:)
    @NSManaged public func addToRepetitionActivities(_ value: Repetition)

    @objc(removeRepetitionActivitiesObject:)
    @NSManaged public func removeFromRepetitionActivities(_ value: Repetition)

    @objc(addRepetitionActivities:)
    @NSManaged public func addToRepetitionActivities(_ values: NSSet)

    @objc(removeRepetitionActivities:)
    @NSManaged public func removeFromRepetitionActivities(_ values: NSSet)

}

// MARK: Generated accessors for respritoryActivities
extension Child {

    @objc(addRespritoryActivitiesObject:)
    @NSManaged public func addToRespritoryActivities(_ value: RespiratoryIssues)

    @objc(removeRespritoryActivitiesObject:)
    @NSManaged public func removeFromRespritoryActivities(_ value: RespiratoryIssues)

    @objc(addRespritoryActivities:)
    @NSManaged public func addToRespritoryActivities(_ values: NSSet)

    @objc(removeRespritoryActivities:)
    @NSManaged public func removeFromRespritoryActivities(_ values: NSSet)

}

// MARK: Generated accessors for sadActivities
extension Child {

    @objc(addSadActivitiesObject:)
    @NSManaged public func addToSadActivities(_ value: Sad)

    @objc(removeSadActivitiesObject:)
    @NSManaged public func removeFromSadActivities(_ value: Sad)

    @objc(addSadActivities:)
    @NSManaged public func addToSadActivities(_ values: NSSet)

    @objc(removeSadActivities:)
    @NSManaged public func removeFromSadActivities(_ values: NSSet)

}

// MARK: Generated accessors for selfHarmActivities
extension Child {

    @objc(addSelfHarmActivitiesObject:)
    @NSManaged public func addToSelfHarmActivities(_ value: SelfHarm)

    @objc(removeSelfHarmActivitiesObject:)
    @NSManaged public func removeFromSelfHarmActivities(_ value: SelfHarm)

    @objc(addSelfHarmActivities:)
    @NSManaged public func addToSelfHarmActivities(_ values: NSSet)

    @objc(removeSelfHarmActivities:)
    @NSManaged public func removeFromSelfHarmActivities(_ values: NSSet)

}

// MARK: Generated accessors for sleepLengthActivities
extension Child {

    @objc(addSleepLengthActivitiesObject:)
    @NSManaged public func addToSleepLengthActivities(_ value: SleepLength)

    @objc(removeSleepLengthActivitiesObject:)
    @NSManaged public func removeFromSleepLengthActivities(_ value: SleepLength)

    @objc(addSleepLengthActivities:)
    @NSManaged public func addToSleepLengthActivities(_ values: NSSet)

    @objc(removeSleepLengthActivities:)
    @NSManaged public func removeFromSleepLengthActivities(_ values: NSSet)

}

// MARK: Generated accessors for sleepQualityActivities
extension Child {

    @objc(addSleepQualityActivitiesObject:)
    @NSManaged public func addToSleepQualityActivities(_ value: SleepQuality)

    @objc(removeSleepQualityActivitiesObject:)
    @NSManaged public func removeFromSleepQualityActivities(_ value: SleepQuality)

    @objc(addSleepQualityActivities:)
    @NSManaged public func addToSleepQualityActivities(_ values: NSSet)

    @objc(removeSleepQualityActivities:)
    @NSManaged public func removeFromSleepQualityActivities(_ values: NSSet)

}

// MARK: Generated accessors for stomachAcheActivities
extension Child {

    @objc(addStomachAcheActivitiesObject:)
    @NSManaged public func addToStomachAcheActivities(_ value: StomachAche)

    @objc(removeStomachAcheActivitiesObject:)
    @NSManaged public func removeFromStomachAcheActivities(_ value: StomachAche)

    @objc(addStomachAcheActivities:)
    @NSManaged public func addToStomachAcheActivities(_ values: NSSet)

    @objc(removeStomachAcheActivities:)
    @NSManaged public func removeFromStomachAcheActivities(_ values: NSSet)

}

// MARK: Generated accessors for tantrumActivities
extension Child {

    @objc(addTantrumActivitiesObject:)
    @NSManaged public func addToTantrumActivities(_ value: Tantrums)

    @objc(removeTantrumActivitiesObject:)
    @NSManaged public func removeFromTantrumActivities(_ value: Tantrums)

    @objc(addTantrumActivities:)
    @NSManaged public func addToTantrumActivities(_ values: NSSet)

    @objc(removeTantrumActivities:)
    @NSManaged public func removeFromTantrumActivities(_ values: NSSet)

}

// MARK: Generated accessors for tremorActivities
extension Child {

    @objc(addTremorActivitiesObject:)
    @NSManaged public func addToTremorActivities(_ value: Tremors)

    @objc(removeTremorActivitiesObject:)
    @NSManaged public func removeFromTremorActivities(_ value: Tremors)

    @objc(addTremorActivities:)
    @NSManaged public func addToTremorActivities(_ values: NSSet)

    @objc(removeTremorActivities:)
    @NSManaged public func removeFromTremorActivities(_ values: NSSet)

}
