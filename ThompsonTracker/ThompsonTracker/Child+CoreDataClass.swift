//
//  Child+CoreDataClass.swift
//  ThompsonTracker
//
//  Created by Will Mock on 5/2/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData
import UIKit


public class Child: NSManagedObject {

    var anxietyActivityArray: [Anxiety]?{
        return self.anxietyActivities?.allObjects as? [Anxiety]
    }
    
    var irritabilityActivityArray: [Irritability]?{
        return self.irritibilityActivities?.allObjects as? [Irritability]
    }
    
    var repetitionActivityArray: [Repetition]?{
        return self.repetitionActivities?.allObjects as? [Repetition]
    }
    
    var selfHarmActivityArray: [SelfHarm]?{
        return self.selfHarmActivities?.allObjects as? [SelfHarm]
    }
    
    var defianceActivityArray: [Defiance]?{
        return self.defianceActivities?.allObjects as? [Defiance]
    }
    
    var tantrumsActivityArray: [Tantrums]?{
        return self.tantrumActivities?.allObjects as? [Tantrums]
    }
    
    var implisivityActivityArray: [Implusivity]?{
        return self.implusiveActivities?.allObjects as? [Implusivity]
    }
    
    var attentionSpanActivityArray: [AttentionSpan]?{
        return self.attentionSpanActivities?.allObjects as? [AttentionSpan]
    }
    
    var hyperActivityArray: [Hyperactivity]?{
        return self.hyperActivities?.allObjects as? [Hyperactivity]
    }
    
    var angryActivityArray: [Angry]?{
        return self.angryActivities?.allObjects as? [Angry]
    }
    
    var calmActivityArray: [Calm]?{
        return self.calmActivities?.allObjects as? [Calm]
    }
    
    var diarrheaActivityArray: [Diarrhea]?{
        return self.diarrheaActivities?.allObjects as? [Diarrhea]
    }
    
    var dietActivityArray: [Diet]?{
        return self.dietActivities?.allObjects as? [Diet]
    }
    
    var excitedActivityArray: [Excited]?{
        return self.excitedActivities?.allObjects as? [Excited]
    }
    
    var happyActivityArray: [Happy]?{
        return self.happyActivities?.allObjects as? [Happy]
    }
    
    var headacheActivityArray: [Headaches]?{
        return self.headacheActivities?.allObjects as? [Headaches]
    }
    
    var respiratoryActivityArray: [RespiratoryIssues]?{
        return self.respritoryActivities?.allObjects as? [RespiratoryIssues]
    }
    
    var sadActivityArray: [Sad]?{
        return self.sadActivities?.allObjects as? [Sad]
    }
    
    var sleepLengthActivityArray: [SleepLength]?{
        return self.sleepLengthActivities?.allObjects as? [SleepLength]
    }
    
    var sleepQualityActivityArray: [SleepQuality]?{
        return self.sleepQualityActivities?.allObjects as? [SleepQuality]
    }
    
    var stomachAcheActivityArray: [StomachAche]?{
        return self.stomachAcheActivities?.allObjects as? [StomachAche]
    }
    
    var tremorActivityArray: [Tremors]?{
        return self.tremorActivities?.allObjects as? [Tremors]
    }
    
    convenience init?(nickName: String?, firstName: String, lastName: String, birthDate: Date, doctorsName: String?, hospital: String?, photo: NSData?) {
        guard let context = Model.sharedInstance.managedContext else{
            return nil
        }
        
        self.init(entity: Child.entity(), insertInto: context)
        
        self.nickName = nickName
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate as NSDate
        self.doctorsName = doctorsName
        self.hospital = hospital
        self.photo = photo
        
        
    }

}
