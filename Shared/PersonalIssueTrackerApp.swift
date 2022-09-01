//
//  PersonalIssueTrackerApp.swift
//  Shared
//
//  Created by mark on 9/1/22.
//

import SwiftUI

@main
struct PersonalIssueTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
