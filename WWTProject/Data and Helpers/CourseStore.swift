//
//  CourseStore.swift
//  WWTProject
//
//  Created by Kyle Fowler on 1/22/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI
import CloudKit

class CourseStore: ObservableObject {
    @Published var courses = [Course]()
    @Published var reviews = [Review]()
    @Published var events = [Event]()
    
    func fetch() {
        courses = []
        
        CloudKitHelper<Course>.fetch { result in
            switch result {
            case .success(let newCourse):
                self.courses.append(newCourse)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func save(_ course: Course) {
        CloudKitHelper.save(course) { result in
            switch result {
            case .success(let newCourse):
                self.courses.append(newCourse)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
