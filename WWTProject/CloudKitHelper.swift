//
//  CloudKitHelper.swift
//  SwiftUICloudKitDemo
//
//  Created by Alex Nagy on 23/09/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import Foundation
import CloudKit
import SwiftUI

// MARK: - notes
// good to read: https://www.hackingwithswift.com/read/33/overview
//
// important setup in CloudKit Dashboard:
//
// https://www.hackingwithswift.com/read/33/4/writing-to-icloud-with-cloudkit-ckrecord-and-ckasset
// https://www.hackingwithswift.com/read/33/5/a-hands-on-guide-to-the-cloudkit-dashboard
//
// On your device (or in the simulator) you should make sure you are logged into iCloud and have iCloud Drive enabled.

struct CloudKitHelper {
    
    // MARK: - record types
    struct RecordType {
        static let Course = "Course"
    }
    
    // MARK: - errors
    enum CloudKitHelperError: Error {
        case recordFailure
        case recordIDFailure
        case castFailure
        case cursorFailure
    }
    
    // MARK: - saving to CloudKit
    static func save(course: Course, completion: @escaping (Result<Course, Error>) -> ()) {
        let record = CKRecord(recordType: RecordType.Course)
        
        record["name"] = course.name as CKRecordValue
        record["teacher"] = course.teacher as CKRecordValue
        
        CKContainer.default().publicCloudDatabase.save(record) { (record, err) in
            DispatchQueue.main.async {
                if let err = err {
                    completion(.failure(err))
                    return
                }
                guard let record = record else {
                    completion(.failure(CloudKitHelperError.recordFailure))
                    return
                }
                
                let recordID = record.recordID
                
                guard let name = record["name"] as? String else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let teacher = record["teacher"] as? String else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                guard let students = record["students"] as? [Student] else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                
                let course = Course(recordID: recordID,
                                    name: name,
                                    teacher: teacher, description: "Test",
                                    students: students)
                
                completion(.success(course))
            }
        }
    }
    
    // MARK: - fetching from CloudKit
    static func fetch(completion: @escaping (Result<Course, Error>) -> ()) {
        let pred = NSPredicate(value: true)
        //let sort = NSSortDescriptor(key: "creationDate", ascending: false)
        // Maybe not right
        
        let query = CKQuery(recordType: RecordType.Course, predicate: pred)
        //query.sortDescriptors = [sort]

        let operation = CKQueryOperation(query: query)
        operation.desiredKeys = ["name", "teacher"]
        
        operation.resultsLimit = 50
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                let recordID = record.recordID
                
                guard let name = record["name"] as? String else { return }
                
                guard let teacher = record["teacher"] as? String else { return }
                
                //guard let students = record["students"] as? [Student] else { return }
                
                let course = Course(recordID: recordID,
                                    name: name,
                                    teacher: teacher, description: "Test",
                                    students: [])
                
                completion(.success(course))
            }
        }
        
        operation.queryCompletionBlock = { (/*cursor*/ _, err) in
            DispatchQueue.main.async {
                if let err = err {
                    completion(.failure(err))
                    return
                }
//                guard let cursor = cursor else {
//                    completion(.failure(CloudKitHelperError.cursorFailure))
//                    return
//                }
//                print("Cursor: \(String(describing: cursor))")
            }
            
        }
        
        CKContainer.default().publicCloudDatabase.add(operation)
    }
    
    // MARK: - delete from CloudKit
    static func delete(recordID: CKRecord.ID, completion: @escaping (Result<CKRecord.ID, Error>) -> ()) {
        CKContainer.default().publicCloudDatabase.delete(withRecordID: recordID) { (recordID, err) in
            DispatchQueue.main.async {
                if let err = err {
                    completion(.failure(err))
                    return
                }
                guard let recordID = recordID else {
                    completion(.failure(CloudKitHelperError.recordIDFailure))
                    return
                }
                completion(.success(recordID))
            }
        }
    }
    
    // MARK: - modify in CloudKit
    static func modify(course: Course, completion: @escaping (Result<Course, Error>) -> ()) {
        guard let recordID = course.recordID else { return }
        CKContainer.default().publicCloudDatabase.fetch(withRecordID: recordID) { record, err in
            if let err = err {
                DispatchQueue.main.async {
                    completion(.failure(err))
                }
                return
            }
            guard let record = record else {
                DispatchQueue.main.async {
                    completion(.failure(CloudKitHelperError.recordFailure))
                }
                return
            }
            
            record["name"] = course.name as CKRecordValue
            record["teacher"] = course.teacher as CKRecordValue

            CKContainer.default().publicCloudDatabase.save(record) { (record, err) in
                DispatchQueue.main.async {
                    if let err = err {
                        completion(.failure(err))
                        return
                    }
                    guard let record = record else {
                        completion(.failure(CloudKitHelperError.recordFailure))
                        return
                    }
                    
                    let recordID = record.recordID
                    
                    guard let name = record["name"] as? String else {
                        completion(.failure(CloudKitHelperError.castFailure))
                        return
                    }
                    guard let teacher = record["teacher"] as? String else {
                        completion(.failure(CloudKitHelperError.castFailure))
                        return
                    }
                    
                
                    
                    let course = Course(recordID: recordID,
                                        name: name,
                                        teacher: teacher, description: "Test",
                                        students: [])
                    
                    completion(.success(course))
                }
            }
        }
    }
}
