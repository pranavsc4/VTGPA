//
//  CoursesDetails.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 5/10/22.
//

import SwiftUI

struct CoursesDetails: View, Equatable {
//    let course: Course
    let category: Category
    var body: some View {
        
        ScrollView {
            // Pie Chart Breakdown
            PieChartView(
//                course: course,
                category: category,
                values: [category.aPercent, category.bPercent, category.cPercent, category.dPercent, category.fPercent],
                names: ["A's", "B's", "C's", "D's", "F,s"],
                formatter: {value in String(format: "%.1f", value)},
                centerText: category.gpa,
                colors: [Color.green, Color.blue, Color.purple, Color.pink, Color.red],
                backgroundColor: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255, opacity: 1.0)
                
            )
                .padding(.all)
                .frame(width: 350, height: 700, alignment: .center)
            
            
            
                .navigationBarTitle(Text("\(category.courseTitle)"), displayMode: .inline)
        }
       
    } // End of Body
}

struct CoursesDetails_Previews: PreviewProvider {
    static var previews: some View {
        CoursesDetails(
//            course: testCourseStruct,
            category: testCategoryStruct)
    }
}
