//
//  CourseStruct.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 4/30/22.
//

import SwiftUI

// Struct Representing Each Course
struct Course: Hashable, Codable, Identifiable {
    var id = UUID()
    
}

//{
//  "Academic Year": "2016-17",
//  "Term": "Spring",
//  "Subject": "HORT",
//  "Course No.": 3346,
//  "Course Title": "Herbaceous Landscape Plants",
//  "Instructor": "Scoggins",
//  "GPA": 3.85,
//  "A (%)": 75,
//  "B (%)": 25,
//  "C (%)": 0,
//  "D (%)": 0,
//  "F (%)": 0,
//  "Withdraws": 0,
//  "Graded Enrollment": 8,
//  "CRN": 19402,
//  "Credits": 0
//},
