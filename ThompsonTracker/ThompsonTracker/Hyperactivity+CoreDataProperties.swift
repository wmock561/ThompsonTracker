//
//  Hyperactivity+CoreDataProperties.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/20/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import CoreData


extension Hyperactivity{//: ValueType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hyperactivity> {
        return NSFetchRequest<Hyperactivity>(entityName: "Hyperactivity")
    }

    @NSManaged public var rawDate: NSDate
    @NSManaged public var value: Int64
    @NSManaged public var activity: Activity?

}
