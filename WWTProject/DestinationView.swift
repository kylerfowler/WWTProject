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
            VStack(alignment: .leading) {
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
                        .padding(.horizontal)
                        .padding(.vertical, 8)
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
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        Spacer()
                    }
                HStack {
                    VStack(alignment: .leading) {
                        Text("Class Reviews")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            .bold()
                            .underline()
                            .padding(.vertical)
                        VStack(alignment: .leading) {
                            Text(course.review.name)
                                .font(.system(size:20))
                            HStack {
                                ForEach(1...course.review.rating, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size:25))
                                }
                            
                                ForEach(course.review.rating ..< 5, id: \.self) { _ in
                                    Image(systemName: "star")
                                        .foregroundColor(.yellow)
                                        .font(.system(size:25))
                                }
                            }
                            Text(course.review.description)
                                .font(.system(size:20))
                        }
                        .padding()
                    .background(backgroundColor)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    }
                .padding(.horizontal)
                .padding(.vertical, 1)
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
