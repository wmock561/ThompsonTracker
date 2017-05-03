//
//  Calm+CoreDataClass.swift
//  ThompsonTracker
//
//  Created by Will Mock on 5/1/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


public class Calm: NSManagedObject {
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
        
        self.init(entity: Calm.entity(), insertInto: context)
        
        self.date = date
        
        self.value = Int64(value)
        
    }
}
