//
//  Course.swift
//  WWTProject
//
//  Created by Kyle Fowler on 1/22/20.
//  Copyright © 2020 Rob Fowler. All rights reserved.
//

import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    
    var name: String
    var teacher: String
    var description: String
    var review: String
    var students: [Student]
}

struct Student: Identifiable {
    var id = UUID()
    
    var name: String
}
