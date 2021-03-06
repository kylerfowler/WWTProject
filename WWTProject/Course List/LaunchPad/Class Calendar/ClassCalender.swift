//
//  ClassCalender.swift
//  WWTProject
//
//  Created by Ryan Monahan on 2/8/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI
import CloudKit

enum TaskType: String {
    case test = "Test"
    case project = "Project"
    case essay = "Essay"
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
                    if event.taskType == TaskType.test {
                        ScheduleEntry(colorTheme: .red, event: event, symbol: "pencil.circle.fill")
                        
                    } else if event.taskType == TaskType.project {
                        ScheduleEntry(colorTheme: .blue, event: event, symbol: "paperclip.circle.fill")
                        
                    // if event.taskType == TaskType.essay
                    } else {
                        ScheduleEntry(colorTheme: .green, event: event, symbol: "doc.circle.fill")
                    }
                }
            }
        }
        .navigationBarTitle(Text("Schedule"))
        .onAppear {
            DispatchQueue.main.async {
                self.store.fetch(courseRecordID: self.course.recordID!)
            }
        }
        .onDisappear {
            self.store.events = []
        }
        .navigationBarItems(trailing:
            NavigationLink(destination: AddCalendarEvent(course: self.course, store: store)) {
                Text("Add Event")
        })
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
