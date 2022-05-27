//
//  CourseDataView.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 5/17/22.
//

import SwiftUI
@available(OSX 10.15, *)
struct CourseDataView: View {
    let course: Course
    var body: some View {
        VStack (alignment: .leading){
            Group {
                Section {
                    Text("Instructor: \(course.instructor)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.black)
                }
            }
        }
    }
}

struct CourseDataView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDataView(course: testCourseStruct)
    }
}
