//
//  AddCalendarEvent.swift
//  WWTProject
//
//  Created by Kyle Fowler on 2/24/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct AddCalendarEvent: View {
    var course: Course
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    @ObservedObject var store: EventStore
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

struct AddCalendarEvent_Previews: PreviewProvider {
    static var previews: some View {
        AddCalendarEvent(course: .test, store: EventStore())
    }
}
