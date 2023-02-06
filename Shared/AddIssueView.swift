//
//  AddIssueView.swift
//  PersonalIssueTracker
//
//  Created by mark on 9/3/22.
//

import SwiftUI

struct AddIssueView: View {
    @StateObject var project: Project
    @State var summaryText: String = ""
    @State var descriptionText: String = ""
    @State var issuePriority: IssuePriority = .low
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Create new issue")
                .font(.title)
                .padding()
            HStack() {
                Text("Summary: ")
                Spacer()
                TextField("Summary: ", text: $summaryText)
                    .padding()
            }
            HStack() {
                Text("Description: ")
                TextEditor(text: $descriptionText)
            }
            Picker("Issue Priority:", selection: $issuePriority) {
                ForEach(IssuePriority.allCases, id: \.self) { priority in
                    let menuText = priority.stringValue()
                    Text("\(menuText)")
                        .tag(priority)
                }
            }
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()

                }, label: {
                    Text("Cancel")
                })
                .keyboardShortcut(.cancelAction)

                Spacer()
                
                Button( action: {
                    addIssue()
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Create Issue")
                })
                .keyboardShortcut(.defaultAction)
            }
        }
        .frame(minWidth: 256, idealWidth: 384, maxWidth: .infinity, minHeight: 256, idealHeight: 384, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
    
    private func addIssue() {
        withAnimation {
            let newIssue = Issue(context: viewContext)
            newIssue.title = summaryText
            newIssue.contents = descriptionText
            newIssue.priority = issuePriority
            newIssue.project = project
            
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

struct AddIssueView_Previews: PreviewProvider {
    static var previews: some View {
        AddIssueView(project: Project())
    }
}
