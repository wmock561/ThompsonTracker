//
//  Activity+CoreDataClass.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/20/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData

@objc(Activity)
public class Activity: NSManagedObject {
    
    var anxietyActivityArray: [Anxiety]?{
        return self.anxietyActivities?.allObjects as? [Anxiety]
    }
    
    var ticsActivityArray: [Tics]?{
        return self.ticsActivities?.allObjects as? [Tics]
    }
    
    var irritabilityActivityArray: [Irritability]?{
        return self.irritibilityActivities?.allObjects as? [Irritability]
    }
    
    var repetitionActivityArray: [Repetition]?{
        return self.repetitionActivities?.allObjects as? [Repetition]
    }
    
    var socailSkillsActivityArray: [SocialSkills]?{
        return self.socialSkillsActivities?.allObjects as? [SocialSkills]
    }
    
    var selfHarmActivityArray: [SelfHarm]?{
        return self.selfHarmActivities?.allObjects as? [SelfHarm]
    }
    
    var defianceActivityArray: [Defiance]?{
        return self.defianceActivities?.allObjects as? [Defiance]
    }
    
    var speechActivityArray: [Speech]?{
        return self.speechActivities?.allObjects as? [Speech]
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
    
    convenience init?(title: String) {
        guard let context = Model.sharedInstance.managedContext else{
            return nil
        }
        
        self.init(entity: Activity.entity(), insertInto: context)
        
    }

}
