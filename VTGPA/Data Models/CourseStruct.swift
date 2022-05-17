//
//  CourseStruct.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 4/30/22.
//

import SwiftUI


// Struct Representing Each Course
public struct Course: Hashable, Codable, Identifiable {
    public var id: String {courseTitle + String(crn) + String(Int.random(in: 0...1000))}
//    var id = UUID()
    public var academicYear: String
    public var term: String
    public var subject: String
    public var courseNumber: String
    public var courseTitle: String
    public var instructor: String
    public var gpa: Double
    public var aPercent: Double
    public var bPercent: Double
    public var cPercent: Double
    public var dPercent: Double
    public var fPercent: Double
    public var withdraws: Int
    public var gradedEnrollment: Int
    public var crn: Int
    public var credits: Int
    
    static let allCourses: [Course] = Bundle.main.decode(file: "GradeDataClean.json")
    
    static let searchableCourseKeyword: [String] = Bundle.main.getSearchableCourseString(courseList: allCourses)

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
    
    func getSearchableCourseString(courseList: [Course]) -> [String]{
        // Searchable Courses List
        var orderedSearchableCoursesList = [String]()
        
        for course in courseList {
            let selectedCourseAttribute = "\(course.courseTitle) \(course.instructor) \(course.courseNumber) \(course.subject)"
            
            orderedSearchableCoursesList.append(selectedCourseAttribute)
        }
//        print(orderedSearchableCoursesList[0])
        return orderedSearchableCoursesList
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
