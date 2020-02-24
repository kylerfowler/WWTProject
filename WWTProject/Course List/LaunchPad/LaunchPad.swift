//
//  DestinationView.swift
//  WWTProject
//
//  Created by Ryan Monahan on 1/27/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//


import SwiftUI

struct LaunchPad: View {
    @EnvironmentObject var store: CourseStore
    var course: Course
    
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    
                    CircleButton(colorTheme: Color.red, label: "Dates", symbol: "calendar.circle.fill", destination: ClassCalender(course: course))
                        .padding(.horizontal, 3)
                    CircleButton(colorTheme: Color.blue, label: "Info", symbol: "info.circle.fill", destination: CourseInfo(course: course))
                        .padding(.horizontal, 3)
                    CircleButton(colorTheme: Color.yellow, label: "Tutor", symbol: "arrow.up.circle.fill", destination: TutorCenter(course: course))
                        .padding(.horizontal, 3)
                }
            }
            .padding()
        }
        .navigationBarTitle(Text(course.name))
    }
}



struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LaunchPad(course: .test)
        }
    }
}

