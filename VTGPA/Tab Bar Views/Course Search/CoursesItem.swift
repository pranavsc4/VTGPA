//
//  CoursesItem.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 5/10/22.
//

import SwiftUI
// Global testStruct for Preview
var testCourseStruct = Course(
    id: UUID(),
    academicYear: "2020-2021",
    term: "Fall",
    subject: "CS",
    courseNumber: "4104",
    courseTitle: "Data Algorithm & Analysis",
    instructor: "Bo Ji",
    gpa: 3.51,
    aPercent: 50,
    bPercent: 25,
    cPercent: 25,
    dPercent: 0,
    fPercent: 0,
    withdraws: 3,
    gradedEnrollment: 88,
    crn: 32101,
    credits: 3)

var testCategoryStruct = Category(
    id: UUID(),
    subject: "CS",
    courseNum: "1114",
    courseTitle: "Data Structures & Algorithms",
    totalEnrollment: 58,
    gpa: 2.98,
    aPercent: 20.0,
    bPercent: 20.0,
    cPercent: 20.0,
    dPercent: 20.0,
    fPercent: 20.0,
    credits: 3,
    numberOfCourses: 2,
    courses:
        [Course(
            id: UUID(),
            academicYear: "2020-2021",
            term: "Fall",
            subject: "CS",
            courseNumber: "1114",
            courseTitle: "Data Structures and Algorithms",
            instructor: "Barnette",
            gpa: 2.53,
            aPercent: 40.0,
            bPercent: 20.0,
            cPercent: 20.0,
            dPercent: 20.0,
            fPercent: 0.00,
            withdraws: 4,
            gradedEnrollment: 29,
            crn: 43432,
            credits: 3)
         ,
         Course(
            id: UUID(),
            academicYear: "2021-2022",
            term: "Fall",
            subject: "CS",
            courseNumber: "1114",
            courseTitle: "Data Structures and Algorithms",
            instructor: "Fox",
            gpa: 3.43,
            aPercent: 0.0,
            bPercent: 20.0,
            cPercent: 20.0,
            dPercent: 20.0,
            fPercent: 40.0,
            withdraws: 3,
            gradedEnrollment: 29,
            crn: 13234,
            credits: 3)]
)

struct CoursesItem: View {
//    let course: Course
    let category: Category
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(category.courseTitle)
                Text(category.subject + " " + category.courseNum)
            }
            
        } // End of HStack
    } // End of Body
}

struct CoursesItem_Previews: PreviewProvider {
    static var previews: some View {
        CoursesItem(
//            course: testCourseStruct,
            category: testCategoryStruct)
    }
}
