//
//  AddReview.swift
//  WWTProject
//
//  Created by Ryan Monahan on 2/18/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI
import CloudKit
import TextView

struct AddReview: View {
    @Environment(\.presentationMode) var presentation
    
    var courseRecordID: CKRecord.ID
    
    @EnvironmentObject var reviewStore: ReviewStore
    
    //@ObservedObject var store: ReviewStore
    
    @State var reviewerName = ""
    @State var description = ""
    @State var rating = 1
    
    var body: some View {
         Form {
            HStack {
                TextField("Name", text: $reviewerName)
            }
            HStack {
                TextField("Description", text: $description)
            }
            HStack {
                ForEach(1...rating, id: \.self) { i in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.title)
                        .onTapGesture {
                            self.rating = i
                    }
                 }
            
                 ForEach(rating ..< 5, id: \.self) { i in
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                        .font(.title)
                        .onTapGesture {
                            self.rating = i + 1
                    }
                 }
             }
           .listStyle(GroupedListStyle())
           .navigationBarTitle(Text("New Review"))
           .navigationBarItems(trailing: Button(action: {
            
            self.reviewStore.save(Review(recordID: nil,
                                         description: self.description,
                                         rating: self.rating,
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
