//
//  ProjectListView.swift
//  PersonalIssueTracker
//
//  Created by mark on 9/2/22.
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
            List {
                ForEach(projects) { project in
                    Text("\(project.name!)")
                }
                .onDelete(perform: deleteProjects)
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Projects")
            .navigationBarItems(leading: EditButton())
            Button(action: { showAddSheet = true }, label: {
                Label("Add", systemImage: "note.text.badge.plus")
            })
        }
        .sheet(isPresented: $showAddSheet) {
            AddProjectView()
        }
    }
    
    private func deleteProjects(offsets: IndexSet) {
        withAnimation {
            offsets.map { projects[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
