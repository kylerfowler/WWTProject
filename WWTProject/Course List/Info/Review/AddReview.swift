//
//  AddReview.swift
//  WWTProject
//
//  Created by Ryan Monahan on 2/18/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI
import CloudKit

struct AddReview: View {
    @Environment(\.presentationMode) var presentation
    
    var courseRecordID: CKRecord.ID
    
    @EnvironmentObject var reviewStore: ReviewStore
    
    //@ObservedObject var store: ReviewStore
    
    @State var reviewerName = ""
    @State var description = ""
    @State var rating: Int? = nil

    
    var body: some View {
         Form {
                HStack {
                    TextField("Name", text: $reviewerName)
                }
                HStack {
                    TextField("Description", text: $description)
                }
                HStack {
                    TextField("Rating: 1 - 5", value: $rating, formatter: NumberFormatter())
                }
               .listStyle(GroupedListStyle())
               .navigationBarTitle(Text("Review"))
               .navigationBarItems(trailing: Button(action: {
                
                self.reviewStore.save(Review(recordID: nil,
                                       description: self.description,
                                       rating: self.rating ?? 3,
                                       reviewerName: self.reviewerName,
                                       date: Date()),
                                courseRecordID: self.courseRecordID)
                
                    self.presentation.wrappedValue.dismiss()
               }){
                    Text("Save")
               })
        }
        }
}

struct AddReview_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddReview(courseRecordID: CKRecord.ID())
        }
    }
}
