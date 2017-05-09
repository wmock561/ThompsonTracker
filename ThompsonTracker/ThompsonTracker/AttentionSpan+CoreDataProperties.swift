//
//  AttentionSpan+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 5/9/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension AttentionSpan {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AttentionSpan> {
        return NSFetchRequest<AttentionSpan>(entityName: "AttentionSpan")
    }

    @NSManaged public var rawDate: NSDate
    @NSManaged public var value: Int64
    @NSManaged public var activity: Child?

}
