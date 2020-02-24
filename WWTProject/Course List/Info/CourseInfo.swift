//
//  DestinationView.swift
//  WWTProject
//
//  Created by Ryan Monahan on 1/27/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct CourseInfo: View {
    var course: Course
    @Environment(\.colorScheme) var colorScheme
    //@ObservedObject var store = ReviewStore()
    @EnvironmentObject var reviewStore: ReviewStore
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                    HStack{
                        VStack(alignment: .leading){
                            Text("Teacher")
                                .font(.system(size: 20))
                                .foregroundColor(.secondary)
                                .bold()
                                .underline()
                            Text(course.teacher)
                                .font(.system(size:20))
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        Spacer()
                    }
                    HStack {
                        VStack(alignment: .leading){
                            Text("Description")
                                .font(.system(size: 20))
                                .foregroundColor(.secondary)
                                .bold()
                                .underline()
                            Text(course.description)
                                .font(.system(size:20))
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        Text("Class Reviews")
                            .font(.system(size: 20))
                            .foregroundColor(.secondary)
                            .bold()
                            .underline()
                            .padding(.vertical)
                    }
                    .padding(.leading)
                    .padding(.bottom, -20)
                
                    ReviewScrollView()//store: store)
                        .onAppear {
                            self.reviewStore.fetch(courseRecordID: self.course.recordID!)
                        }
                }
                .navigationBarTitle(Text(course.name))
            .navigationBarItems(trailing: NavigationLink(destination: AddReview(courseRecordID: course.recordID!)) {
                Text("Add Review")
            })
        }
    }
}

struct CourseInfo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CourseInfo(course: .test)
        }
    }
}
