//
//  ContentView.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 4/30/22.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        TabView {
//            Home()
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("Home")
//                }
            CoursesList()
                .tabItem {
                    Image(systemName: "magnifyingglass.circle.fill")
                    Text("Search Courses")
                }
        } // End of Tab
    }// End of Body
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
