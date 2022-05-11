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
    var academicYear: String
    var subject: String
    var courseNumber: Int
    var courseTitle: String
    var instructor: String
    var gpa: Double
    var aPercent: Double
    var bPercent: Double
    var cPercent: Double
    var dPercent: Double
    var fPercent: Double
    var gradedEnrollment: Int
    var crn: Int
    var credits: Int
}

//{
// "academicYear": "2016-17",
// "term": "Spring",
// "subject": "HORT",
// "courseNumber": 3346,
// "courseTitle": "Herbaceous Landscape Plants",
// "instructor": "Scoggins",
// "gpa": 3.85,
// "aPercent": 75,
// "bPercent": 25,
// "cPercent": 0,
// "dPercent": 0,
// "fPercent": 0,
// "withdraws": 0,
// "gradedEnrollment": 8,
// "crn": 19402,
// "credits": 0
//}
