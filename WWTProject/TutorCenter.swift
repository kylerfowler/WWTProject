//
//  TutorCenter.swift
//  WWTProject
//
//  Created by Ryan Monahan on 2/12/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//


struct TutorButton<Destination: View>: View {
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

import SwiftUI

struct TutorCenter: View {
    
    var course: Course
    
    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    TutorButton(colorTheme: .blue, label: "Request A Tutor", symbol: "arrow.up.circle.fill", destination: Text("Request a tutor"))
                }
            }
        }.navigationBarTitle(Text("Tutor Center"))
    }
}

struct TutorCenter_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TutorCenter(course: .test)
        }
    }
}
