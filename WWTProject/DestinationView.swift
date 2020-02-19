//
//  DestinationView.swift
//  WWTProject
//
//  Created by Ryan Monahan on 1/27/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//


import SwiftUI


struct CircleButton<Destination: View>: View {
    var colorTheme: Color
    var label: String
    var symbol: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                Image(systemName: symbol)
                    .font(.system(size: 70))
                    .foregroundColor(colorTheme)
                    .padding(.vertical, 8)
                Text(label)
                    .font(.system(size: 17))
                    .foregroundColor(colorTheme)
                    .multilineTextAlignment(.center)
            }
        }
    }
}


struct DestinationView: View {
    @EnvironmentObject var store: CourseStore
    var course: Course
    
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    
                    CircleButton(colorTheme: Color.red, label: "Dates", symbol: "calendar.circle.fill", destination: ClassCalender(course: course))
                        .padding(.horizontal, 3)
                    CircleButton(colorTheme: Color.blue, label: "Info", symbol: "info.circle.fill", destination: ClassInfo(course: course))
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
            DestinationView(course: .test)
        }
    }
}

