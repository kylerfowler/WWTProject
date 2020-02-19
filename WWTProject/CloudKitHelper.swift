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

protocol Convertable {
    static var RecordType: String { get }
    
    var recordID: CKRecord.ID? { get set }
    
    init?(from record: CKRecord)
    
    func convertToRecord() -> CKRecord
    
    func modify(_ record: CKRecord)
}

struct CloudKitHelper<Item: Convertable> {
    // MARK: - errors
    enum CloudKitHelperError: Error {
        case recordFailure
        case recordIDFailure
        case castFailure
        case cursorFailure
    }
    
    // MARK: - saving to CloudKit
    static func save(_ item: Item, courseRecordID: CKRecord.ID? = nil, completion: @escaping (Result<Item, Error>) -> ()) {
        let record = item.convertToRecord()
        if let courseRecordID = courseRecordID {
            let courseReference = CKRecord.Reference(recordID: courseRecordID, action: .none)
            record["course"] = courseReference as CKRecordValue
        }
        
        CKContainer.default().publicCloudDatabase.save(record) { (record, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let record = record else {
                    completion(.failure(CloudKitHelperError.recordFailure))
                    return
                }
                
                guard let item = Item(from: record) else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                
                completion(.success(item))
            }
        }
    }
    
    // MARK: - fetching from CloudKit
    static func fetch(courseRecordID: CKRecord.ID? = nil, completion: @escaping (Result<Item, Error>) -> ()) {
        
        var predicate = NSPredicate(value: true)
        
        if let courseRecordID = courseRecordID {
            let courseReference = CKRecord.Reference(recordID: courseRecordID, action: .none)
            predicate = NSPredicate(format: "course == %@", courseReference)
        }
        //let sort = NSSortDescriptor(key: "creationDate", ascending: false)
        
        let query = CKQuery(recordType: Item.RecordType, predicate: predicate)
        //query.sortDescriptors = [sort]

        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                guard let item = Item(from: record) else { return }
                
                completion(.success(item))
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
    static func modify(_ item: Item, completion: @escaping (Result<Item, Error>) -> ()) {
        guard let recordID = item.recordID else { return }
        CKContainer.default().publicCloudDatabase.fetch(withRecordID: recordID) { record, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let record = record else {
                completion(.failure(CloudKitHelperError.recordFailure))
                return
            }
            
            item.modify(record)

            CKContainer.default().publicCloudDatabase.save(record) { (record, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        completion(.failure(error))
                        return
                    }
                    
                    guard let record = record else {
                        completion(.failure(CloudKitHelperError.recordFailure))
                        return
                    }
                    
                    guard let item = Item(from: record) else {
                        completion(.failure(CloudKitHelperError.castFailure))
                        return
                    }
                    
                    completion(.success(item))
                }
            }
        }
    }
}
