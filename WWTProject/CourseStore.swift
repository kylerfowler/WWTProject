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
    
    func fetchCourses() {
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
    
    func fetchReviews(courseRecordID: CKRecord.ID) {
        reviews = []
        
        CloudKitHelper<Review>.fetch(courseRecordID: courseRecordID) { result in
            switch result {
            case .success(let newReview):
                self.reviews.append(newReview)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func save(_ review: Review, courseRecordID: CKRecord.ID) {
        CloudKitHelper.save(review, courseRecordID: courseRecordID) { result in
            switch result {
            case .success(let newReview):
                self.reviews.append(newReview)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchEvents(courseRecordID: CKRecord.ID) {
        events = []
        
        CloudKitHelper<Event>.fetch(courseRecordID: courseRecordID) { result in
            switch result {
            case .success(let newEvent):
                self.events.append(newEvent)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func save(_ event: Event, courseRecordID: CKRecord.ID) {
        CloudKitHelper.save(event, courseRecordID: courseRecordID) { result in
            switch result {
            case .success(let newEvent):
                self.events.append(newEvent)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
