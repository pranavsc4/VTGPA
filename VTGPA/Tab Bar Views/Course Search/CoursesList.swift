//
//  CoursesList.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 5/10/22.
//

import SwiftUI



struct CoursesList: View {
    private var courses: [Course] = Course.allCourses
    var body: some View {
        NavigationView {
            LazyVStack {
                ForEach(courses) { course in
                    Text(course.courseTitle)
                    
                }
            } // End of Lazy VSTack
            .navigationTitle(Text("Search Courses"))
        } // End of Navigation View
        
    } // End of Body
}

struct CoursesList_Previews: PreviewProvider {
    static var previews: some View {
        CoursesList()
    }
}
