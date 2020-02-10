//
//  Course.swift
//  WWTProject
//
//  Created by Kyle Fowler on 1/22/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    
    var name: String
    var teacher: String
    var description: String
    var reviews: [Review] = []
    var students: [Student] = []
    var tutor: [Tutor] = []
    var tutee: [Tutee] = []
    var message: [Conversation] = []
    var calendar: [Calendar] = []
    
    static var test = Course(name: "Calculus",
    teacher: "Lennett Hampton",
    description: "A high level math class",
    reviews: [Review(description: "This class made me very angry.",
                     rating: 3,
                     reviewerName: "Ryan Monahan", date: Date()),
              Review(description: "This class made me very angry.",
                             rating: 5,
                             reviewerName: "Ryan Monahan", date: Date())],
    students: [], tutor: [], tutee: [], message: [], calendar: [])
}

struct Student: Identifiable {
    var id = UUID()
    
    var name: String
}

struct Review: Identifiable {
    var id = UUID()
    
    var description: String
    var rating: Int
    var reviewerName: String
    var date: Date
}

struct Tutor: Identifiable {
    var id = UUID()
    
    var name: String
    var course: String
    var availableDates: [Date]
    var isQualified: Bool
    var recommendingTeacher: String
}

struct Tutee: Identifiable {
    var id = UUID()
    
    var name: String
    var course: String
    
}
struct Conversation: Identifiable {
    var id = UUID()
    
    var students: [Student]
    var message: String
    
}
struct Calendar: Identifiable {
    var id = UUID()
    
    var date: Date
    var eventName: String
    var subject: String
    var tasktype: String
}
