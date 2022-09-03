//
//  IssueDetailView.swift
//  PersonalIssueTracker
//
//  Created by mark on 9/3/22.
//

import SwiftUI

struct IssueDetailView: View {
    @StateObject var issue: Issue
    @State var summaryText: String
    @State var descriptionText: String
    
    var body: some View {
        // Show the details of the selected issue.
        ScrollView {
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
            .padding()
        }
    }
}

struct IssueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IssueDetailView(issue: Issue(), summaryText: "Summary", descriptionText: "Description of issue")
    }
}
