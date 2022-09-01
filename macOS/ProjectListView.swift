//
//  SwiftUIView.swift
//  PersonalIssueTracker (macOS)
//
//  Created by mark on 9/1/22.
//

import SwiftUI

struct ProjectListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Project.name, ascending: true)],
        animation: .default)
    private var projects: FetchedResults<Project>
    
    var body: some View {
        List(projects) { project in
            Text("\(project.name!)")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
