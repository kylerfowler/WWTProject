//
//  DestinationView.swift
//  WWTProject
//
//  Created by Ryan Monahan on 1/27/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct DestinationView: View {
    var course: Course
    @Environment(\.colorScheme) var colorScheme
    
    var backgroundColor: Color {
           switch colorScheme {
               case .dark:
                   return Color(.secondarySystemBackground)
                   
               case .light:
                   return Color.white
               
               @unknown default:
                   fatalError()
           }
       }
    
    
    var body: some View {
        ScrollView {
            VStack() {
                    HStack{
                        VStack(alignment: .leading){
                            Text("Teacher")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                                .bold()
                                .underline()
                            Text(course.teacher)
                                .font(.system(size:20))
                        }
                        .padding()
                        Spacer()
                    }
                    HStack {
                        VStack(alignment: .leading){
                            Text("Description")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                                .bold()
                                .underline()
                            Text(course.description)
                                .font(.system(size:20))
                        }
                        .padding()
                        Spacer()
                    }
                HStack {
                    VStack(alignment: .leading) {
                        Text("Class Reviews")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            .bold()
                            .underline()
                        HStack {
                            
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size:25))
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size:25))
                                Image(systemName: "star")
                                    .foregroundColor(.yellow)
                                    .font(.system(size:25))
                                Image(systemName: "star")
                                    .foregroundColor(.yellow)
                                    .font(.system(size:25))
                                Image(systemName: "star")
                                    .foregroundColor(.yellow)
                                    .font(.system(size:25))

                        }
                        Text(course.review.description)
                            .font(.system(size:20))
                    }
                .padding()
                Spacer()
                }
            }
        }
        .navigationBarTitle(Text(course.name))
    .navigationBarItems(trailing: NavigationLink(destination: Text("Message Board")) {
        Text("Class Chat")
    })
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DestinationView(course: Course(name: "Calculus",
                                                     teacher: "Lennett Hampton",
                                                     description: "A high level math class",
                                                     review: Review(description: "This class made me very angry.",
                                                                    rating: 2,
                                                                    name: "Ryan Monahan"),
                                                     students: []))
        }
    }
}
