//
//  CourseData.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 5/10/22.
//

import Foundation
import SwiftUI

// Global Array of Course Structs
var coursesStructList = [Course]()
// Searchable Courses List
var orderedSearchableCoursesList = [String]()

public func readCoursesDataFile() {
    // On Launch, Document Directory will not have Files
    var documentDirectoryHasFiles = false
    // Grade Data Filename
    let coursesDataFileFullFilename = "GradeDataClean.json"
    
    // Global constant documentDirectory is defined in UtilityFunctions.swift
    let urlOfJsonFileInDocumentDirectory = documentDirectory.appendingPathComponent(coursesDataFileFullFilename)
    
    do {
        /*
         Try to get the contents of the file. The left hand side is
         suppressed by using '_' since we do not use it at this time.
         Our purpose is just to check to see if the file is there or not.
         */
 
        _ = try Data(contentsOf: urlOfJsonFileInDocumentDirectory)
       
        /*
         If 'try' is successful, it means that the CountriesData.json
         file exists in document directory on the user's device.
         ---
         If 'try' is unsuccessful, it throws an exception and
         executes the code under 'catch' below.
         */
       
        documentDirectoryHasFiles = true
       
        /*
         --------------------------------------------------
         |   The app is being launched after first time   |
         --------------------------------------------------
         The CountriesData.json file exists in document directory on the user's device.
         Load it from Document Directory into countryStructList.
         */
       
        // The function is given in UtilityFunctions.swift
        coursesStructList = decodeJsonFileIntoArrayOfStructs(fullFilename: coursesDataFileFullFilename, fileLocation: "Document Directory")
        print("CoursesData is loaded from document directory")
    } catch {
        documentDirectoryHasFiles = false
       
        /*
         ----------------------------------------------------
         |   The app is being launched for the first time   |
         ----------------------------------------------------
         The CountriesData.json file does not exist in document directory on the user's device.
         Load it from main bundle (project folder) into countryStructList.
        
         This catch section will be executed only once when the app is launched for the first time
         since we write and read the files in document directory on the user's device after first use.
         */
       
        // The function is given in UtilityFunctions.swift
        coursesStructList = decodeJsonFileIntoArrayOfStructs(fullFilename: coursesDataFileFullFilename, fileLocation: "Main Bundle")
        print("CoursesData is loaded from main bundle")
        
        for course in coursesStructList {
            let selectedCourseAttribute = "\(course.courseTitle)|\(course.instructor)|\(course.courseNumber)|\(course.subject)"
            
            orderedSearchableCoursesList.append(selectedCourseAttribute)
        }
    } // End of Try-Catch
    
    /*
    ----------------------------------------
    Read OrderedSearchableCoursesList File
    ----------------------------------------
    */
    if documentDirectoryHasFiles {
        // Obtain URL of the file in document directory on the user's device
        let urlOfFileInDocDir = documentDirectory.appendingPathComponent("OrderedSearchableCoursesList")
       
        // Instantiate an NSArray object and initialize it with the contents of the file
        let arrayFromFile: NSArray? = NSArray(contentsOf: urlOfFileInDocDir)
       
        if let arrayObtained = arrayFromFile {
            // Store the unique id of the created array into the global variable
            orderedSearchableCoursesList = arrayObtained as! [String]
        } else {
            print("OrderedSearchableCoursesList file is not found in document directory on the user's device!")
        }
    }
    
}
