//
//  ReviewStore.swift
//  WWTProject
//
//  Created by Kyle Fowler on 2/18/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI
import CloudKit

class EventStore: ObservableObject {
    @Published var events = [Event]()
    
    func fetch(courseRecordID: CKRecord.ID) {
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
