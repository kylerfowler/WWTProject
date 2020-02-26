//
//  ReviewView.swift
//  WWTProject
//
//  Created by Ryan Monahan on 1/31/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct ReviewView: View {
    var review: Review
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(1...review.rating, id: \.self) { _ in
                    Star(filled: true)
                }
           
                ForEach(review.rating ..< 5, id: \.self) { _ in
                    Star(filled: false)
                }
            }
            
            Text(review.description)
                .lineLimit(nil)
                .padding()
            
            HStack {
                Spacer()
                Text("-\(review.reviewerName)")
                    .font(.caption)
            }
        }
        .frame(width: 300)
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
        
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(review: Review(recordID: nil,
                                  description: "Test Review Desc.",
                                  rating: 3,
                                  reviewerName: "Ryan",
                                  date: Date()))
    }
}
