//
//  CourseDataView.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 5/17/22.
//

import SwiftUI

struct CourseDataView: View {
    let aCourse: Course
    var body: some View {
        VStack (alignment: .leading){
            HStack (alignment: VerticalAlignment.top){
                Text(aCourse.courseTitle)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .padding(.all)
                    .frame(maxWidth: .infinity)
            }
            
        }
    }
}

struct CourseDataView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDataView(aCourse: testStruct)
    }
}
