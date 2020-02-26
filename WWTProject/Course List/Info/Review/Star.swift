//
//  Star.swift
//  WWTProject
//
//  Created by Kyle Fowler on 2/24/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct Star: View {
    var filled: Bool
    
    var systemName: String {
        if filled {
            return "star.fill"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        Image(systemName: systemName)
            .foregroundColor(.yellow)
            .font(.title)
    }
}

struct Star_Previews: PreviewProvider {
    static var previews: some View {
        Star(filled: false)
    }
}
