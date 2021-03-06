//
//  ContentView.swift
//  WWTProject
//
//  Created by Kyle Fowler on 1/22/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    @EnvironmentObject var store: CourseStore
    @EnvironmentObject var reviewStore: ReviewStore
    
    var body: some View {
        NavigationView {
            ZStack {
                if store.courses.isEmpty {
                    VStack {
                        Spacer()
                        Text("Classes loading...")
                        Spacer()
                        Spacer()
                    }
                }
                
                ScrollView {
                    ForEach(store.courses) { course in
                        ZStack {
                            NavigationLink(destination: LaunchPad(course: course)) {
                                CourseOverview(course)
                            }
                            InfoButton(course: course)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .onAppear {
                            self.reviewStore.fetch(courseRecordID: course.recordID!)
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("Classes")
        }
    .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            self.store.fetch()
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList().environmentObject(CourseStore())
    }
}
