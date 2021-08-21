//
//  Course.swift
//  ScheduleU
//
//  Created by Adam S on 2021-04-26.
//

import Foundation

import Foundation

struct Course : Codable, Identifiable {
    var id: Int
    var Name : String
    var Code : String
    var Description : String
    var Credit : Double
    var AntiRequisites : [String]?
    var PreRequisites : [String]?
};

class CourseArray : ObservableObject {
    init () {
        var studentArray : [Student] = []

        let catalogueOne = Catalogue(Department: "Department of Science", MajorSpecMin: "Major", Degree: "Computer Science", TotalCreditCount: 6.0, RequiredCourses: ["CS2214", "CS1027", "CS1000"], RequiredCourseDescription: "You need 3.0 courses in")
        let catalogueTwo = Catalogue(Department: "Department of History", MajorSpecMin: "Minor", Degree: "World History", TotalCreditCount: 2.0, RequiredCourses: ["HIST1023", "HIST9012", "PHIL1000"], RequiredCourseDescription: "You need 2.0 courses in")
        let studentOne = Student(id: 251035776, StudentName: "Adam Salaymeh", Primary: catalogueOne, Secondary: catalogueTwo, allRequired: [])
        studentArray.append(studentOne)

        let index1 : Int = studentArray.firstIndex(where: {$0.id == 251035776})!

        for item in studentArray[index1].Primary.RequiredCourses {
            let name = item
            let index = array.firstIndex(where: {$0.Code == name})!
            studentArray[index1].addTask(course: array[index])
            
        }
        //https://westerncalendar.uwo.ca/Modules.cfm?ModuleID=21112&SelectedCalendar=Live&ArchiveID= catalogue
        //https://westerncalendar.uwo.ca/Courses.cfm?CourseAcadCalendarID=MAIN_006440_1&SelectedCalendar=Live&ArchiveID= courses
        
        
        //what we do is provide it with degree and major, it will pull out the correct catalogue, we add that catalogue to student array, then we loop through required courses in both catalogies (primary and secondary) and add requiredCourses. This is will then be used for crosscheck

        
        print(studentArray[index1].allRequired)

    }
    @Published var array : [Course] = Bundle.main.decode("Courses.json")
    
   

    
}

class WorksheetArray : ObservableObject {
    @Published var array : [Course] = []
}


