//
//  IssueListView.swift
//  PersonalIssueTracker
//
//  Created by mark on 9/2/22.
//

import SwiftUI

struct IssueListView: View {
    @StateObject var project: Project
    @State private var showAddSheet = false
    @State private var selection: Issue? = nil
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack {
            Text("Open Issues")
                .font(.title)
            List(issueArray) { issue in
                NavigationLink(destination: IssueDetailView(issue: issue, titleText: issue.title ?? "", descriptionText: issue.contents ?? ""), tag: issue, selection: $selection) {
                    Text(issue.title ?? "")
                }
            }
            HStack {
                Button(action: { showAddSheet = true }, label: {
                    Label("Add", systemImage: "note.text.badge.plus")
                })

                Spacer()

                // How do I get the selected item to the delete them.
                Button(action: {
                    closeIssue(selection!)
                }, label: {
                    Label("Close", systemImage: "trash")
                        .foregroundColor(.red)
                })
            }
            .padding(.horizontal, 6)
            .padding(6)
        }
        .sheet(isPresented: $showAddSheet) {
            AddIssueView(project: project)
        }
    }
    
    var issueArray: [Issue] {
        let allIssues = project.issues?.allObjects as? [Issue] ?? []
        let openIssues = allIssues.filter {
            $0.open == true
        }
        return openIssues
    }
    
    func closeIssue(_ issue: Issue) {
        issue.open = false
        
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

struct IssueListView_Previews: PreviewProvider {
    static var previews: some View {
        IssueListView(project: Project())
    }
}
