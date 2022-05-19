//
//  CoursesItem.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 5/10/22.
//

import SwiftUI
// Global testStruct for Preview
var testStruct = Course(
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

struct CoursesItem: View {
    let course: Course
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(course.courseTitle)
                Text(course.instructor)
                Text(course.academicYear + " " + course.term)
                Text(course.subject + " " + course.courseNumber)
            }
            
        } // End of HStack
    } // End of Body
}

struct CoursesItem_Previews: PreviewProvider {
    static var previews: some View {
        CoursesItem(course: testStruct)
    }
}
