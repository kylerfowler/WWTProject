//
//  CourseStore.swift
//  WWTProject
//
//  Created by Kyle Fowler on 1/22/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

class CourseStore: ObservableObject {
    @Published var courses = [Course]()
    
    func fetchCourses() {
        courses = [Course(name: "Calculus",
                          teacher: "Lennett Hampton",
                          description: "A high level math class",
                          review: Review (description: "A Great Class!",
                                          rating: 4,
                                          name: "Ryan Monahan"),
                          students: []),
                   Course(name: "Cyber Security",
                          teacher: "Kristy Hagan",
                          description: "",
                          review: Review (description: "A Great Class!",
                          rating: 4,
                          name: "Ryan Monahan"),
                          students: []),
                   Course(name: "Personal Finance",
                          teacher: "Kasey Roberts",
                          description: "",
                          review: Review (description: "A Great Class!",
                          rating: 4,
                          name: "Ryan Monahan"),
                          students: []),
                   Course(name: "Vocations",
                          teacher: "Denise Bossert",
                          description: "",
                          review: Review (description: "A Great Class!",
                          rating: 4,
                          name: "Ryan Monahan"),
                          students: []),
                   Course(name: "Physics 2",
                          teacher: "Joe Groaning",
                          description: "",
                          review: Review (description: "A Great Class!",
                          rating: 4,
                          name: "Ryan Monahan"),
                          students: []),
                   Course(name: "British Literature",
                          teacher: "Denise Bossert",
                          description: "",
                          review: Review (description: "A Great Class!",
                          rating: 4,
                          name: "Ryan Monahan"),
                          students: [])]
    }
}