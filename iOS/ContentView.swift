//
//  ContentView.swift
//  PersonalIssueTracker (iOS)
//
//  Created by mark on 9/6/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Project.name, ascending: true)],
        animation: .default)
    private var projects: FetchedResults<Project>

    var body: some View {
        NavigationView {
            ProjectListView()
            EmptyView()
            EmptyView()
        }
        .navigationViewStyle(.columns)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
