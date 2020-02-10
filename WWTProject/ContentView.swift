//
//  ContentView.swift
//  WWTProject
//
//  Created by Kyle Fowler on 1/22/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: CourseStore
    
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
                            NavigationLink(destination: DestinationView(course: course)) {
                                CourseOverview(course)
                                    
                            }
                            InfoButton(course: course)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("Classes")
        }
        .onAppear {
            self.store.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CourseStore())
    }
}
