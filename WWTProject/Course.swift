//
//  Course.swift
//  WWTProject
//
//  Created by Kyle Fowler on 1/22/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI
import CloudKit

struct Course: Identifiable, Convertable {
    var id = UUID()
    
    static var RecordType = "Course"
    
    var recordID: CKRecord.ID?
    
    var name: String
    var teacher: String
    var description: String
    
    /*
    var reviews: [Review]
    var students: [Student]
    var tutors: [Tutor]
    var tutees: [Tutee]
    var message: [Conversation]
    var calendar: [Event]
 */
    
    init?(from record: CKRecord) {
        guard let name = record["name"] as? String else { return nil }
        guard let teacher = record["teacher"] as? String else { return nil }
        guard let description = record["description"] as? String else { return nil }
        
        self.init(recordID: record.recordID,
                  name: name,
                  teacher: teacher,
                  description: description)
    }
    
    init(recordID: CKRecord.ID?, name: String, teacher: String, description: String) {
        self.recordID = recordID
        self.name = name
        self.teacher = teacher
        self.description = description
    }
    
    func convertToRecord() -> CKRecord {
        let record = CKRecord(recordType: Self.RecordType)
        
        self.modify(record)
        
        return record
    }
    
    func modify(_ record: CKRecord) {
        record["name"] = name as CKRecordValue
        record["teacher"] = teacher as CKRecordValue
        record["description"] = description as CKRecordValue
    }
    
    static var test = Course(recordID: nil,
                             name: "Calculus",
                             teacher: "Lennett Hampton",
                             description: "A high level math class")
    
    static var test = Course(name: "Calculus",
    teacher: "Lennett Hampton",
    description: "A high level math class",
    reviews: [Review(description: "This class made me very angry.",
                     rating: 3,
                     reviewerName: "Ryan Monahan", date: Date()),
              Review(description: "This class made me very angry.",
                             rating: 5,
                             reviewerName: "Ryan Monahan", date: Date())],
    students: [], tutor: [], tutee: [], message: [],
    calendar: [Event(date: Date(), name: "Calculus Test Over Chapter 3", subject: "Calculus", taskType: "Test")])
}

struct Student: Identifiable {
    var id = UUID()
    
    var recordID: CKRecord.ID?
    
    var name: String
}

struct Review: Identifiable, Convertable {
    var id = UUID()
    
    static var RecordType = "Review"
    
    var recordID: CKRecord.ID?
    
    var description: String
    var rating: Int
    var reviewerName: String
    var date: Date
    
    init?(from record: CKRecord) {
        guard let description = record["description"] as? String else { return nil }
        guard let rating = record["rating"] as? Int else { return nil }
        guard let reviewerName = record["reviewerName"] as? String else { return nil }
        guard let date = record["date"] as? Date else { return nil }
        
        self.init(recordID: record.recordID,
                  description: description,
                  rating: rating,
                  reviewerName: reviewerName,
                  date: date)
    }
    
    init(recordID: CKRecord.ID?, description: String, rating: Int, reviewerName: String, date: Date) {
        self.recordID = recordID
        self.description = description
        self.rating = rating
        self.reviewerName = reviewerName
        self.date = date
    }
    
    func convertToRecord() -> CKRecord {
        let record = CKRecord(recordType: Self.RecordType)
        
        self.modify(record)
        
        return record
    }
    
    func modify(_ record: CKRecord) {
        record["description"] = description as CKRecordValue
        record["rating"] = rating as CKRecordValue
        record["reviewerName"] = reviewerName as CKRecordValue
        record["date"] = date as CKRecordValue
    }
}

struct Tutor: Identifiable {
    var id = UUID()
    
    var name: String
    var course: String
    var availableDates: [Date]
    var isQualified: Bool
    var recommendingTeacher: String
}

struct Tutee: Identifiable {
    var id = UUID()
    
    var name: String
    var course: String
    
}
struct Conversation: Identifiable {
    var id = UUID()
    
    var students: [Student]
    var message: String
    
}

struct Event: Identifiable, Convertable {
    var id = UUID()
    
    static var RecordType = "Event"
    
    var recordID: CKRecord.ID?
    
    var date: Date
    var name: String
    var subject: String
    var taskType: String
    
    init?(from record: CKRecord) {
        guard let date = record["date"] as? Date else { return nil }
        guard let name = record["name"] as? String else { return nil }
        guard let subject = record["subject"] as? String else { return nil }
        guard let taskType = record["taskType"] as? String else { return nil }
        
        self.init(recordID: record.recordID,
                  date: date,
                  name: name,
                  subject: subject,
                  taskType: taskType)
    }
    
    init(recordID: CKRecord.ID?, date: Date, name: String, subject: String, taskType: String) {
        self.date = date
        self.name = name
        self.subject = subject
        self.taskType = taskType
    }
    
    func convertToRecord() -> CKRecord {
        let record = CKRecord(recordType: Self.RecordType)
        
        self.modify(record)
        
        return record
    }
    
    func modify(_ record: CKRecord) {
        record["date"] = date as CKRecordValue
        record["name"] = name as CKRecordValue
        record["subject"] = subject as CKRecordValue
        record["taskType"] = taskType as CKRecordValue
    }
}
