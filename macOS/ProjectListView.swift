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
    @State private var selection: Project? = nil
    
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
            .onAppear {
                selection = projects.first
            }
            .onDeleteCommand {
                deleteProject()
            }
            HStack {
                Button(action: { showAddSheet = true }, label: {
                    Label("Add", systemImage: "note.text.badge.plus")
                })

                Spacer()

                // How do I get the selected item to the delete them.
                Button(action: { deleteProject() }, label: {
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
    
    private func deleteProject() {
        withAnimation {
            if let selection = self.selection {
                viewContext.delete(selection)
            }

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

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
