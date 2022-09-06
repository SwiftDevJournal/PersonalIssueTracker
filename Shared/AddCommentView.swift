//
//  AddCommentView.swift
//  PersonalIssueTracker
//
//  Created by mark on 9/6/22.
//

import SwiftUI

struct AddCommentView: View {
    @State private var commentText: String = "Comment"
    @StateObject var issue: Issue
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack {
            Text("New Comment")
                .bold()
            TextEditor(text: $commentText)
            Button(action: {
                addComment()
            }, label: {
                Text("Comment")
            })
        }
    }
    
    private func addComment() {
        withAnimation {
            let newComment = Comment(context: viewContext)
            newComment.contents = commentText
            newComment.creationDate = Date()
            newComment.issue = issue

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

struct AddCommentView_Previews: PreviewProvider {
    static var previews: some View {
        AddCommentView(issue: Issue())
    }
}
