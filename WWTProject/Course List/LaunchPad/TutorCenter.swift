//
//  TutorCenter.swift
//  WWTProject
//
//  Created by Ryan Monahan on 2/12/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

struct SendEmailButton: View {
    var email: String
    
    var body: some View {
        Text(email)
            .foregroundColor(.blue)
            .onTapGesture {
                if let url = URL(string: "mailto:\(self.email)") {
                    UIApplication.shared.open(url)
                }
        }
    }
}

import SwiftUI

struct TutorCenter: View {
    var course: Course
    
    @ObservedObject var store = TutorStore()
    
    var body: some View {
        List(store.tutors) { tutor in
            VStack {
                HStack {
                    Spacer()
                    Text(tutor.name)
                    Spacer()
                }
            
                HStack {
                    Spacer()
                    SendEmailButton(email: tutor.email)
                    Spacer()
                }
            }
        }
        .navigationBarTitle(Text("Tutor Center"))
        .onAppear {
            DispatchQueue.main.async {
                self.store.fetch(courseRecordID: self.course.recordID!)
            }
        }
        .onDisappear {
            self.store.tutors = []
        }
    }
}

struct TutorCenter_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TutorCenter(course: .test)
        }
    }
}
