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
            Text(review.reviewerName)
                .font(.system(size:20))
            HStack {
                ForEach(1...review.rating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size:25))
                }
           
                ForEach(review.rating ..< 5, id: \.self) { _ in
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                        .font(.system(size:25))
                }
            }
            Text(review.description)
                .font(.system(size:20))
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(review: Review(description: "Test Review Desc.", rating: 3, reviewerName: "Ryan", date: Date()))
    }
}
