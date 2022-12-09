//
//  Issue.swift
//  PersonalIssueTracker
//
//  Created by mark on 12/4/22.
//

import Foundation
import CoreData

enum IssuePriority: Int, CaseIterable {
    case low = 1
    case medium = 2
    case high = 3
    
    // Convert to string to display in menus
    func stringValue() -> String {
        switch(self) {
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }
}

extension Issue {
    var priority: IssuePriority {
        get {
            return IssuePriority(rawValue: Int(self.priorityLevel)) ?? .low
        }
        set {
            self.priorityLevel = Int64(newValue.rawValue)
        }
    }
}
