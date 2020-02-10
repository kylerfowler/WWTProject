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
                    .font(.system(size: 100))
                    .foregroundColor(colorTheme)
                    .padding()
                Text(label)
                    .foregroundColor(colorTheme)

            }
            .frame(width: 150, height: 150)
        }
    }
}


struct DestinationView: View {
    var course: Course
    
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    CircleButton(colorTheme: Color.red, label: "Important Dates", symbol: "calendar.circle.fill", destination: ClassCalender())
                    CircleButton(colorTheme: Color.green, label: "Group Message", symbol: "message.circle.fill", destination: Text("Group Message"))
                }
                HStack {
                    CircleButton(colorTheme: Color.blue, label: "Class Information", symbol: "info.circle.fill", destination: ClassInfo(course: course))
                    CircleButton(colorTheme: Color.yellow, label: "Tutor Center", symbol: "arrow.up.circle.fill", destination:Text("Tutor Center"))
                }
            }
        }
        .navigationBarTitle(Text(course.name))
    }
}



struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DestinationView(course: Course(name: "Calculus",
                                                     teacher: "Lennett Hampton",
                                                     description: "A high level math class",
                                                     reviews: [Review(description: "This class made me very angry.",
                                                                      rating: 3,
                                                                      name: "Ryan Monahan"),
                                                               Review(description: "This class made me very angry.",
                                                                              rating: 5,
                                                                              name: "Ryan Monahan")],
                                                               students: []))
        
        }
    }
}

