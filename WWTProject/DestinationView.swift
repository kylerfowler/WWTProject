//
//  DestinationView.swift
//  WWTProject
//
//  Created by Ryan Monahan on 1/27/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct DestinationView: View {
    @Binding var course: Course
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
                VStack {
                    HStack {
                        Text(course.teacher)
                            .font(.system(size: 30))
                            .padding(.horizontal)
                        Spacer()
                    }
                    HStack {
                        Text(course.description)
                            
                            .padding(.horizontal)
                        Spacer()
                    }
                        
                    .padding()
                    .background(backgroundColor)
                    .cornerRadius(8)
                    .shadow(radius: 4)
            }
        }
        .navigationBarTitle(Text(course.name))
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DestinationView(course: .constant(Course(name: "Calculus",
                                                     teacher: "Lennett Hampton",
                                                     description: "This is a description",
                                                     review: "This is a review",
                                                     students: [])))
        }
    }
}
