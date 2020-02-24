//
//  CourseOverview.swift
//  WWTProject
//
//  Created by Kyle Fowler on 1/22/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct CourseOverview: View {
    @Environment(\.colorScheme) var colorScheme
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
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
    }
}


struct CourseOverview_Previews: PreviewProvider {
    static var previews: some View {
        CourseOverview(.test)
            .padding()
    }
}
