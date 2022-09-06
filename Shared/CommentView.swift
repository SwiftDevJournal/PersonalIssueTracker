//
//  CommentView.swift
//  PersonalIssueTracker
//
//  Created by mark on 9/6/22.
//

import SwiftUI

// I need this function to deal with the comment possibly being nil. If the comment text is nil, place a default value in the text editor.
func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}

struct CommentView: View {
    @State var comment: Comment
    
    var body: some View {
        TextEditor(text: $comment.contents ?? "")
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comment: Comment())
    }
}
