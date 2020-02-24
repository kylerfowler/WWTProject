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
    //@ObservedObject var store: ReviewStore
    @EnvironmentObject var reviewStore: ReviewStore
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(reviewStore.reviews) { review in
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
