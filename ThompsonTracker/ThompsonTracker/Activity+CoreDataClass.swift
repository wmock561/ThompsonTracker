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
