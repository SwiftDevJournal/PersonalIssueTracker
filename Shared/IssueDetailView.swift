//
//  IssueDetailView.swift
//  PersonalIssueTracker
//
//  Created by mark on 9/3/22.
//

import SwiftUI

struct IssueDetailView: View {
    @StateObject var issue: Issue
    @State var titleText: String
    @State var descriptionText: String
    
    var body: some View {
        // Show the details of the selected issue.
        ScrollView {
            HStack() {
                Text("Title: ")
                Spacer()
                TextField("Title: ", text: $titleText)
                    .padding()
            }
            HStack() {
                Text("Description: ")
                TextEditor(text: $descriptionText)
            }
            VStack {
                Text("Comments")
                    .bold()
                ForEach(commentArray) { comment in
                    CommentView(comment: comment)
                }
            }
            .padding()
            AddCommentView(issue: issue)
        }
    }
    
    var commentArray: [Comment] {
        let unsortedComments = issue.comments?.allObjects as? [Comment] ?? []
        let sortedCommentsByDate = unsortedComments.sorted(by: { lhs, rhs in
            return lhs.creationDate ?? Date() < rhs.creationDate ?? Date()
        })
        return sortedCommentsByDate
    }
}

struct IssueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IssueDetailView(issue: Issue(), titleText: "Title", descriptionText: "Description of issue")
    }
}
