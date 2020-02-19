//
//  ClassCalender.swift
//  WWTProject
//
//  Created by Ryan Monahan on 2/8/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI
import CloudKit

struct ScheduleEntry: View {
    
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    
    var colorTheme: Color
    var event: Event
    var symbol: String
    
    var body: some View {
        HStack {
            Image(systemName: symbol)
                .foregroundColor(colorTheme)
                .font(.system(size: 60))
                .padding(.vertical)
            VStack {
                Text(event.name)
                    .foregroundColor(colorTheme)
                    .font(.system(size:20))
                    .bold()
            }
            Divider()
            Text("\(event.date, formatter: Self.taskDateFormat)")
                .foregroundColor(colorTheme)
                .font(.system(size:20))
                
        }
    }
}




struct ClassCalender: View {
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var course: Course
    
    @ObservedObject var store = EventStore()
    
    var body: some View {
        List {
            ForEach(store.events) { event in
                Group {
                    if event.taskType == "test" || event.taskType == "Test" {
                        ScheduleEntry(colorTheme: .red, event: event, symbol: "pencil.circle.fill")
                        
                    } else if event.taskType == "Project" || event.taskType == "project" {
                        ScheduleEntry(colorTheme: .blue, event: event, symbol: "paperclip.circle.fill")
                        
                    } else if event.taskType == "Essay" {
                        ScheduleEntry(colorTheme: .green, event: event, symbol: "doc.circle.fill")
                    // if event.taskType = "essay"
                    } else {
                        ScheduleEntry(colorTheme: .green, event: event, symbol: "doc.circle.fill")
                    }
                }
            }
        }
        .navigationBarTitle(Text("\(course.name) Schedule"))
            /*
        .navigationBarItems(trailing:
            NavigationLink(destination: AddEvent(course: self.course, store: self.store)) {
            Text("Add Event")
        })
         */
        
    }
}

/*
struct ClassCalender_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClassCalender(course: .test)
        }
    }
}
 */
