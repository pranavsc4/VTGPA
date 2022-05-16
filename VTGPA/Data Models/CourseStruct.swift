//
//  CourseStruct.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 4/30/22.
//

import SwiftUI

// Struct Representing Each Course
struct Course: Hashable, Codable, Identifiable {
    var id: Int { crn }
//    var id = UUID()
    var academicYear: String
    var term: String
    var subject: String
    var courseNumber: String
    var courseTitle: String
    var instructor: String
    var gpa: Double
    var aPercent: Double
    var bPercent: Double
    var cPercent: Double
    var dPercent: Double
    var fPercent: Double
    var withdraws: Int
    var gradedEnrollment: Int
    var crn: Int
    var credits: Int
    
    static let allCourses: [Course] = Bundle.main.decode(file: "GradeDataClean.json")
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        let data: Data
        
        do {
            data = try Data(contentsOf: url)
        } catch {
            fatalError("Failed to load \(file) from bundle.: \(error)")
        }
        
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Could not load \(file) from bundle.")
//        }
        
        let decoder = JSONDecoder()
        
        let loadedData: T
        do {
            loadedData = try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Failed to decode \(file) from bundle.: \(error)")
        }
        
//        guard let loadedData = try? decoder.decode(T.self, from: data) else {
//            fatalError("Could not decode \(file) from bundle.")
//        }
        
        return loadedData
    }
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
