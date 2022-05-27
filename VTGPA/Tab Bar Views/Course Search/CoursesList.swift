//
//  CoursesList.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 5/10/22.
//

import SwiftUI



struct CoursesList: View {
//    private var courses: [Course] = Course.allCourses
    private var categories: [Category] = Category.allCategories
//    private var sublistCourses = courses[0...1000]
//    private var keywords: [String] = Course.searchableCourseKeyword
    private var catKeywords: [String] = Category.searchKeywords
    @State private var searchItem = ""
    var body: some View {
        NavigationView {
            List {
                SearchBar(searchItem: $searchItem, placeholder: "Search Courses")
                ForEach(catKeywords[0...categories.count-1].filter
                        {self.searchItem.isEmpty ? true : $0.localizedStandardContains(self.searchItem)}, id: \.self)
                { course in
                    NavigationLink(destination: CoursesDetails(
//                        course: self.searchCourseItem(searchListItem: course),
                        category: self.searchCategoryItem(searchListItem: course)))
                    {
                        CoursesItem(
//                            course: self.searchCourseItem(searchListItem: course),
                        category: self.searchCategoryItem(searchListItem: course))
                    }
                }
            } //End of List
//            .id(self.searchCourseItem(searchListItem: self.searchItem).id)
            .navigationTitle(Text("Search Courses"))
//            .foregroundColor(Color(red: 131/255, green: 31/255, blue: 65/255))
        } // End of Navigation View
        .navigationViewStyle(.stack)
    } // End of Body
    
//    func searchCourseItem(searchListItem: String) -> Course {
//        let index = courses.firstIndex(where: {$0.id.uuidString == searchListItem.components(separatedBy: "|")[0]})!
//        return courses[index]
//    }
    
    func searchCategoryItem(searchListItem: String) -> Category {
        let index = categories.firstIndex(where: {$0.id.uuidString == searchListItem.components(separatedBy: "|")[0]})!
        return categories[index]
    }
}

struct CoursesList_Previews: PreviewProvider {
    static var previews: some View {
        CoursesList()
    }
}
