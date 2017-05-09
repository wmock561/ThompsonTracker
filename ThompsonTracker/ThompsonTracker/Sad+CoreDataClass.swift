//
//  Sad+CoreDataClass.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/28/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData

@objc(Sad)
public class Sad: NSManagedObject {
    var date: Date{
        get{
            return rawDate as Date
        }
        set(newDate){
            rawDate = newDate as NSDate
            
        }
    }
    
    convenience init?(date: Date, value: Int) {
        
        guard let context = Model.sharedInstance.managedContext else{
            return nil
        }
        
        self.init(entity: Sad.entity(), insertInto: context)
        
        self.date = date
        
        self.value = Int64(value)
        
    }
}
