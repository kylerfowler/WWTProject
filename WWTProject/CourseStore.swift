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
                          students: []),
                   Course(name: "Cyber Security",
                          teacher: "Kristy Hagan",
                          students: []),
                   Course(name: "Personal Finance",
                          teacher: "Kasey Roberts",
                          students: []),
                   Course(name: "Religion",
                          teacher: "Denise Bossert",
                          students: []),
                   Course(name: "Physics 2",
                          teacher: "Joe Groaning",
                          students: []),
                   Course(name: "British Literature",
                          teacher: "Denise Bossert",
                          students: [])]
    }
}
