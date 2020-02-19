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

enum TaskType: String {
    case test = "Test"
    case essay = "Essay"
    case product = "Product"
}

struct ClassCalender: View {
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var course: Course
    
    @EnvironmentObject var store: CourseStore
    
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
        .onAppear {
            DispatchQueue.main.async {
                self.store.fetchEvents(courseRecordID: self.course.recordID!)
            }
        }
        .onDisappear {
            self.store.events = []
        }
        .navigationBarItems(trailing:
            NavigationLink(destination: AddCalendarEvent(course: self.course)) {
                Text("Add Event")
        })
    }
}

struct AddCalendarEvent: View {
    var course: Course
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    @EnvironmentObject var store: CourseStore
    @Environment(\.presentationMode) var presentation
    
    @State var date = Date()
    @State var name = ""
    @State var subject = ""
    @State var taskType = ""
    
    var body: some View {
        Form {
            HStack {
                TextField("Name of Assignment", text: $name)
            }
        
            HStack {
                TextField("Type of Assignment", text: $taskType)
            }
        
            VStack {
                DatePicker(selection: $date, in: Date()..., displayedComponents: .date) {
                    Text("Date")
                }
            
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Add Assignment")
            .navigationBarItems(trailing: Button(action: {
                 self.store.save(Event(recordID: nil,
                                       date: self.date,
                                       name: self.name,
                                       subject: self.course.name,
                                       taskType: self.taskType),
                                 courseRecordID: self.course.recordID!)
             
                 self.presentation.wrappedValue.dismiss()
            }){
                 Text("Save")
            })
        }
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
