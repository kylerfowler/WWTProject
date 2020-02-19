//
//  AddEvent.swift
//  WWTProject
//
//  Created by Ryan Monahan on 2/18/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct AddEvent: View {
    var course : Course
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    @ObservedObject var store: EventCalendar
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
               .navigationBarTitle(Text("Add Assignment"))
               .navigationBarItems(trailing: Button(action: {
                self.store.save(Event(date: self.date,
                                      name: self.name,
                                      subject: (self.course.name),
                                      taskType: self.taskType))
                
                    self.presentation.wrappedValue.dismiss()
               }){
                    Image(systemName: "plus.circle.fill")
                       .font(.system(size: 25))
               })
        }
    }
}


struct AddEvent_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddEvent(course: .test, store: EventCalendar())
        }
    }
}

