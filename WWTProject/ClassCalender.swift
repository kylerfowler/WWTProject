//
//  ClassCalender.swift
//  WWTProject
//
//  Created by Ryan Monahan on 2/8/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI
import CloudKit

struct ClassCalender: View {
    @ObservedObject var calendar = EventCalendar()
    
    var courseRecordID: CKRecord.ID
    
    var body: some View {
        List(calendar.events) { event in
            Text(event.name)
        }
        .onAppear {
            self.calendar.fetch(courseRecordID: self.courseRecordID)
        }
    }
}
/*
struct ClassCalender_Previews: PreviewProvider {
    static var previews: some View {
        ClassCalender(courseRecordID: <#CKRecord.ID#>)
    }
}
 */
