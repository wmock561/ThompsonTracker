//
//  Diarrhea+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 5/9/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension Diarrhea {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Diarrhea> {
        return NSFetchRequest<Diarrhea>(entityName: "Diarrhea")
    }

    @NSManaged public var rawDate: NSDate
    @NSManaged public var value: Int64
    @NSManaged public var activity: Child?

}
