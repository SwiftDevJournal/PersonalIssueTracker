//
//  Issue.swift
//  PersonalIssueTracker
//
//  Created by mark on 12/4/22.
//

import Foundation
import CoreData

enum IssuePriority: Int {
    case low = 1
    case medium = 2
    case high = 3
}

extension Issue {
    @NSManaged private var priorityValue: Int
    
    var priority: IssuePriority {
        get {
            return IssuePriority(rawValue: self.priorityValue) ?? .low
        }
        set {
            self.priorityValue = newValue.rawValue
        }
    }
}
