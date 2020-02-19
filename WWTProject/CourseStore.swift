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
