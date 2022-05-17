//
//  CoursesList.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 5/10/22.
//

import SwiftUI



struct CoursesList: View {
    private var courses: [Course] = Course.allCourses
//    private var sublistCourses = courses[0...1000]
    private var keywords: [String] = Course.searchableCourseKeyword
    @State private var searchItem = ""
    var body: some View {
        NavigationView {
            List {
                SearchBar(searchItem: $searchItem, placeholder: "Search Courses")
                ForEach(keywords[0...1000].filter
                        {self.searchItem.isEmpty ? true : $0.localizedStandardContains(self.searchItem)}, id: \.self)
                { course in
                    NavigationLink(destination: CoursesDetails(course: self.searchCourseItem(searchListItem: course)))
                    {
                        CoursesItem(course: self.searchCourseItem(searchListItem: course))
                    }
                }
            } //End of List
            .navigationTitle(Text("Search Courses"))
        } // End of Navigation View
        .navigationViewStyle(.stack)
    } // End of Body
    
    func searchCourseItem(searchListItem: String) -> Course {
        var index = 0
//        print(courses.capacity)
        for i in 0...(courses.capacity) {
            if (searchListItem.contains(keywords[i])) {
                index = i
                break
            }
        }
        return courses[index]
    }
}

struct CoursesList_Previews: PreviewProvider {
    static var previews: some View {
        CoursesList()
    }
}
