//
//  InfoButton.swift
//  WWTProject
//
//  Created by Ryan Monahan on 2/3/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct InfoButton: View {
    var course: Course
    
    var body: some View {
        VStack {
           HStack {
            Spacer()
            NavigationLink(destination: CourseInfo(course: course)) {
                Image(systemName: "info.circle")
                    .padding()
                    .font(.system(size: 25))
                    .foregroundColor(.gray)
                }
            }
            Spacer()
        }
    }
}

struct InfoButton_Previews: PreviewProvider {
    static var previews: some View {
        InfoButton(course: .test)
    }
}
