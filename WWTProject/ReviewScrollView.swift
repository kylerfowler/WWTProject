//
//  ReviewScrollView.swift
//  WWTProject
//
//  Created by Ryan Monahan on 2/19/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI
import CloudKit

struct ReviewScrollView: View {
    @EnvironmentObject var store: CourseStore
    var courseRecordID: CKRecord.ID?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(store.reviews) { review in
                    ReviewView(review: review)
                        .padding(.leading)
                }
            }
        }
        
        
    }
}

struct ReviewScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewScrollView()
    }
}
