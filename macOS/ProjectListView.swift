//
//  SwiftUIView.swift
//  PersonalIssueTracker (macOS)
//
//  Created by mark on 9/1/22.
//

import SwiftUI

struct ProjectListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var showAddSheet = false
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Project.name, ascending: true)],
        animation: .default)
    private var projects: FetchedResults<Project>
    
    var body: some View {
        VStack {
            Text("Projects")
                .font(.title)
            List(projects) { project in
                Text("\(project.name!)")
            }
            HStack {
                Button(action: { showAddSheet = true }, label: {
                    Label("Add", systemImage: "note.text.badge.plus")
                })

                Spacer()

                Button(action: {  }, label: {
                    Label("Delete", systemImage: "trash")
                        .foregroundColor(.red)
                })
                    .keyboardShortcut(.delete, modifiers: [])
            }
            .padding(.horizontal, 6)
            .padding(6)
        }
        .sheet(isPresented: $showAddSheet) {
            AddProjectView()
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
