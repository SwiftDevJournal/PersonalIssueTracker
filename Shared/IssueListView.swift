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
    
    var body: some View {
        VStack {
            Text("Issues")
                .font(.title)
            List(issueArray) { issue in
                NavigationLink(destination: IssueDetailView(issue: issue, summaryText: issue.title ?? "", descriptionText: issue.contents ?? ""), tag: issue, selection: $selection) {
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
        return project.issues?.allObjects as? [Issue] ?? []
    }
    
    func closeIssue(_ issue: Issue) {
        issue.open = false
    }
}

struct IssueListView_Previews: PreviewProvider {
    static var previews: some View {
        IssueListView(project: Project())
    }
}
