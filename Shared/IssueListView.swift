//
//  IssueListView.swift
//  PersonalIssueTracker
//
//  Created by mark on 9/2/22.
//

import SwiftUI

struct IssueListView: View {
    @Binding var project: Project
    
    var body: some View {
        VStack {
            Text("Issues")
                .font(.title)
            List(issueArray) { issue in
                Text(issue.title ?? "")
            }
        }
    }
    
    var issueArray: [Issue] {
        return project.issues?.allObjects as? [Issue] ?? []
    }
}

struct IssueListView_Previews: PreviewProvider {
    static var previews: some View {
        IssueListView(project: .constant(Project()))
    }
}
