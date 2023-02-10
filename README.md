# Personal Issue Tracker

A project demonstrating how to use Core Data in a SwiftUI app.

## Requirements

* iOS 15+
* maOS 11+

## Code Notes

This project uses Xcode's class generation for the Core Data entities. You will have to look at the data model file to see the attributes of the Core Data entities.

### Views

The project list view shows a list of projects sorted in alphabetical order.

Selecting a project fills the issue list view with the project's issues. There are separate lists for open and closed issues. The issues are sorted by issue priority, with the highest priority issues at the top of the list.

Selecting an issue fills the issue detail view with details on the issue: title, description, and comments. The comments are sorted by date, with the earliest comments at the top of the list. Use the issue detail view to add comments to an issue.

There are also views to add a project and add an issue.
