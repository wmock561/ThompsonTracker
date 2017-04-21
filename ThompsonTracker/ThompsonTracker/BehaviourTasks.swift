//
//  behaviourTasks.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/17/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import UIKit

enum BehaviourTasks: Int {
    case hyperactivity
    case impulsivity
    case repitition
    case anxiety
    case attention
    case irritability
    case selfHarm
    case tics
    case defiance
    case social
    case speech
    case tantrums
    
    var string: String {
        return String(describing: self)
    }
}
