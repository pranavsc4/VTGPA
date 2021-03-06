//
//  PieChartView.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 5/16/22.
//
import SwiftUI

@available(OSX 10.15, *)
public struct PieChartView: View {
//    public let course: Course
    public let category: Category
    public let values: [Double]
    public let names: [String]
    public let formatter: (Double) -> String
    
    public let centerText: Double
    
    public var colors: [Color]
    public var backgroundColor: Color
    
    public var widthFraction: CGFloat
    public var innerRadiusFraction: CGFloat
    
    @State private var activeIndex: Int = -1
    
    var slices: [PieSliceData] {
        let sum = values.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceData] = []
        
        for (i, value) in values.enumerated() {
            
            let degrees: Double = value * 360 / sum
            tempSlices.append(PieSliceData(startAngle: Angle(degrees: endDeg), endAngle: Angle(degrees: endDeg + degrees), text: String(format: "%.0f%%", value * 100 / sum), color: self.colors[i]))
            endDeg += degrees
            
            
        }
        return tempSlices
    }
    
    public init(/*course: Course,*/ category: Category, values:[Double], names: [String], formatter: @escaping (Double) -> String, centerText: Double, colors: [Color] = [Color.blue, Color.green, Color.orange], backgroundColor: Color = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255, opacity: 1.0), widthFraction: CGFloat = 0.75, innerRadiusFraction: CGFloat = 0.60){
//        self.course = course
        self.category = category
        self.values = values
        self.names = names
        self.formatter = formatter
        self.centerText = centerText
        self.colors = colors
        self.backgroundColor = backgroundColor
        self.widthFraction = widthFraction
        self.innerRadiusFraction = innerRadiusFraction
    }
    
    public var body: some View {
        GeometryReader { geometry in
            VStack{
                ZStack{
                    ForEach(0..<self.values.count){ i in
//                        print(self.slices[i].text)
                        if self.slices[i].text != "0%" {
                            PieSlice(pieSliceData: self.slices[i])
                                .scaleEffect(self.activeIndex == i ? 1.03 : 1)
                                .animation(.spring())
                        }
                    }
                    .frame(width: widthFraction * geometry.size.width, height: widthFraction * geometry.size.width)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                let radius = 0.5 * widthFraction * geometry.size.width
                                let diff = CGPoint(x: value.location.x - radius, y: radius - value.location.y)
                                let dist = pow(pow(diff.x, 2.0) + pow(diff.y, 2.0), 0.5)
                                if (dist > radius || dist < radius * innerRadiusFraction) {
                                    self.activeIndex = -1
                                    return
                                }
                                var radians = Double(atan2(diff.x, diff.y))
                                if (radians < 0) {
                                    radians = 2 * Double.pi + radians
                                }
                                
                                for (i, slice) in slices.enumerated() {
                                    if (radians < slice.endAngle.radians) {
                                        self.activeIndex = i
                                        break
                                    }
                                }
                            }
                            .onEnded { value in
                                self.activeIndex = -1
                            }
                    )
                    Circle()
                        .fill(self.backgroundColor)
                        .frame(width: widthFraction * geometry.size.width * innerRadiusFraction, height: widthFraction * geometry.size.width * innerRadiusFraction)
                    
                    VStack {
                        Text(self.activeIndex == -1 ? "GPA" : names[self.activeIndex])
                            .font(.title)
                            .foregroundColor(Color.black)
                        Text(self.formatter(self.activeIndex == -1 ? centerText : values[self.activeIndex]))
                            .font(.title)
                            .foregroundColor(Color.black)
                    }
                    
                } // End of ZStack
//                Spacer()
                PieChartRows(colors: self.colors, names: self.names, values: self.values.map { String(format: "%.1f%%", $0 * 100 / self.values.reduce(0, +)) }, percents: self.values.map { String(format: "%.0f%%", $0 * 100 / self.values.reduce(0, +)) })
//                CourseDataView(course: self.course)
                
            } // End of VStack
            .background(self.backgroundColor)
            .foregroundColor(Color.white)
        } // End of Geometry Reader
    } // End of Body view
}

@available(OSX 10.15, *)
struct PieChartRows: View {
    var colors: [Color]
    var names: [String]
    var values: [String]
    var percents: [String]
//    var course: Course
    var body: some View {
        VStack{
            ForEach(0..<self.values.count){ i in
                HStack {
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(self.colors[i])
                        .frame(width: 20, height: 20)
                    Text(self.names[i])
                        .foregroundColor(Color.black)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(self.values[i])
                            .foregroundColor(Color.black)
//                        Text(self.percents[i])
//                            .foregroundColor(Color.black)
                    }
                }
            }
            
//            VStack {
//
//            }
//            VStack (alignment: .leading){
//                // Title
//                Text(self.course.courseTitle)
//                    .foregroundColor(Color.black)
//
//                // Instructor
//                Text(self.course.instructor)
//                    .foregroundColor(Color.black)
//
//                // Year + Term ex: Fall 2021
//                Text(course.term + " " + course.academicYear)
//                    .foregroundColor(Color.black)
//
//                // GPA Value
//                Text(String(course.gpa))
//                    .foregroundColor(Color.black)
//
//            } 
        }
    }
}

@available(OSX 10.15.0, *)
struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(
//                     course: testCourseStruct,
                     category: testCategoryStruct,
                     values: [testCategoryStruct.aPercent,
                              testCategoryStruct.bPercent,
                              testCategoryStruct.cPercent,
                              testCategoryStruct.dPercent],
                     names: ["A Percent",
                             "B Percent",
                             "C Percent",
                             "D Percent"],
                     formatter: {value in String(format: "%.2f", value)},
                     centerText: 3.85,
                     colors: [Color.green, Color.blue, Color.purple, Color.pink, Color.red]
                     )
    }
}
