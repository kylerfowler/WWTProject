//
//  ScheduleEntry.swift
//  WWTProject
//
//  Created by Kyle Fowler on 2/24/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct ScheduleEntry: View {
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
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
            
            Spacer()
            Text(event.name)
                .foregroundColor(colorTheme)
                .font(.system(size:20))
                .bold()
                
            Spacer()
            Text("\(event.date, formatter: Self.taskDateFormat)")
                .foregroundColor(colorTheme)
                .font(.system(size:20))
        }
           // .frame(width: 73, height: 60, alignment: .leading)
    }
}
