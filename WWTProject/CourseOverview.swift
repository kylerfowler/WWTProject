//
//  CourseOverview.swift
//  WWTProject
//
//  Created by Kyle Fowler on 1/22/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct CourseOverview: View {
    var course: Course
    
    init(_ course: Course) {
        self.course = course
    }
    
    var body: some View {
        VStack {
            Text(course.name)
                .font(.title)
                .foregroundColor(.blue)
            Divider()
            Text(course.teacher)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            Color(.secondarySystemBackground)
                .cornerRadius(8)
                .shadow(radius: 8)
        )
    }
}

struct CourseOverview_Previews: PreviewProvider {
    static var previews: some View {
        CourseOverview(Course(name: "Calculus",
                              teacher: "Hampton",
                              students: [Student(name: "Ryan Monahan"),
                                         Student(name: "Kyle Folwer")]
                              )).padding()
    }
}
