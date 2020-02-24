//
//  ReviewStore.swift
//  WWTProject
//
//  Created by Kyle Fowler on 2/18/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI
import CloudKit

class ReviewStore: ObservableObject {
    @Published var reviews = [Review]()
    
    func fetch(courseRecordID: CKRecord.ID) {
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

}
