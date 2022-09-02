//
//  AddProjectView.swift
//  PersonalIssueTracker
//
//  Created by mark on 9/2/22.
//

import SwiftUI

struct AddProjectView: View {
    @Environment(\.presentationMode) var presentationMode
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
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Add Project")
                })
                .keyboardShortcut(.defaultAction)
            }
        }
        .padding()
    }
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView()
    }
}
