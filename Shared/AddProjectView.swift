//
//  AddProjectView.swift
//  PersonalIssueTracker
//
//  Created by mark on 9/2/22.
//

import SwiftUI

struct AddProjectView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    @State private var newProjectName = "New Project"
    
    var body: some View {
        VStack {
            Text("Enter the name for the new project")
                .font(.headline)
            TextField("Name", text: $newProjectName)
                .padding(.vertical)
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()

                }, label: {
                    Text("Cancel")
                })
                .keyboardShortcut(.cancelAction)

                Spacer()
                
                Button( action: {
                    addProject()
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Add Project")
                })
                .keyboardShortcut(.defaultAction)
            }
        }
        .padding()
    }
    
    private func addProject() {
        withAnimation {
            let newProject = Project(context: viewContext)
            newProject.name = newProjectName

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

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView()
    }
}
