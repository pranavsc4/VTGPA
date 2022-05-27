//
//  CategoryStruct.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 5/26/22.
//

import SwiftUI

public struct Category: Hashable, Codable, Identifiable {
    public var id: UUID
    public var subject: String
    public var courseNum: String
    public var courseTitle: String
    public var totalEnrollment: Int
    public var gpa: Double
    public var aPercent: Double
    public var bPercent: Double
    public var cPercent: Double
    public var dPercent: Double
    public var fPercent: Double
    public var credits: Int
    public var numberOfCourses: Int
    public var courses: [Course]
    
    static let allCategories: [Category] = Bundle.main.decode(file: "GradeDataCompress.json")
    
    static let searchKeywords: [String] = Bundle.main.getSearchableCategoryString(catList: allCategories)
}

extension Bundle {
    func getSearchableCategoryString(catList: [Category]) -> [String]{
        var orderedSearchableCategoryList = [String]()
        
        for cat in catList {
            let selectedCategoryAttribute = "\(cat.id)|\(cat.courseTitle)|\(cat.subject) \(cat.courseNum)|\(cat.courseNum) \(cat.subject)"
            orderedSearchableCategoryList.append(selectedCategoryAttribute)
        }
        
        return orderedSearchableCategoryList
    }
}
