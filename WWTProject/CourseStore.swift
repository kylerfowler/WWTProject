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
                          teacher: "Lennett Hampton", description: "", review: "",
                          students: []),
                   Course(name: "Cyber Security",
                          teacher: "Kristy Hagan", description: "", review: "",
                          students: []),
                   Course(name: "Personal Finance",
                          teacher: "Kasey Roberts", description: "", review: "",
                          students: []),
                   Course(name: "Vocations",
                          teacher: "Denise Bossert", description: "", review: "",
                          students: []),
                   Course(name: "Physics 2",
                          teacher: "Joe Groaning", description: "", review: "",
                          students: []),
                   Course(name: "British Literature",
                          teacher: "Denise Bossert", description: "", review: "",
                          students: [])]
    }
}
