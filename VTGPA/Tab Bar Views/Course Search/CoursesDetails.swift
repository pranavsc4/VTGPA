//
//  CoursesDetails.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 5/10/22.
//

import SwiftUI

struct CoursesDetails: View, Equatable {
    let course: Course
    var body: some View {
        
        ScrollView {
            // Pie Chart Breakdown
            PieChartView(
                course: course,
                values: [course.aPercent, course.bPercent, course.cPercent, course.dPercent, course.fPercent],
                names: ["A's", "B's", "C's", "D's", "F,s"],
                formatter: {value in String(format: "%.2f", value)},
                centerText: course.gpa,
                colors: [Color.green, Color.blue, Color.purple, Color.pink, Color.red] //,
//                backgroundColor = Color(red: 30 / 255, green: 54 / 255, blue: 14 / 255, opacity: 1.0))
                
            )
                .padding(.all)
                .frame(width: 350, height: 700, alignment: .center)
            
            
            
                .navigationBarTitle(Text("\(course.courseTitle)"), displayMode: .inline)
        }
       
    } // End of Body
}

struct CoursesDetails_Previews: PreviewProvider {
    static var previews: some View {
        CoursesDetails(course: testStruct)
    }
}
