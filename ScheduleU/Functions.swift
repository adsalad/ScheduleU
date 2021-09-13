//
//  Functions.swift
//  ScheduleU
//
//  Created by Adam S on 2021-08-23.
//

import Foundation

extension String {
    var splitByComma : [String] {
        return self.components(separatedBy: ", ")
    }
}

func createStudent(alertIsPresented : inout Bool, catalogueArray : [Catalogue], studentArray: inout [Student] , firstOptionString : String, secondOptionString : String, studentID : String, studentName : String ) {
        
    let firstOptionArray = firstOptionString.splitByComma
    let secondOptionArray = secondOptionString.splitByComma
    
    //send alert
    if firstOptionArray[0] == secondOptionArray[0] {
        alertIsPresented = true
    }
    
    let major = catalogueArray.firstIndex(where: {$0.Degree == firstOptionArray[0] && $0.MajorSpecMin == firstOptionArray[1]})
    let minor = catalogueArray.firstIndex(where: {$0.Degree == secondOptionArray[0] && $0.MajorSpecMin == secondOptionArray[1]})
    let student = Student(id: Int(studentID) ?? 0, StudentName: studentName, Primary: catalogueArray[major ?? 0], Secondary: catalogueArray[minor ?? 0], allRequired: [])
    studentArray.append(student)
}


//maybe this can be refactored?
func addRequiredCourses (studentID : String, studentArray: inout [Student], courseArray: [Course]) {
    let index1 : Int = studentArray.firstIndex(where: {$0.id == Int(studentID)})!

    for item in studentArray[index1].Primary.RequiredCourses {
        let name = item
        let index = courseArray.firstIndex(where: {$0.Code == name})!
        studentArray[index1].addTask(course: courseArray[index])
        
    }
    for item in studentArray[index1].Secondary.RequiredCourses {
        let name = item
        let index = courseArray.firstIndex(where: {$0.Code == name})!
        studentArray[index1].addTask(course: courseArray[index])
    }
    print(studentArray[index1].allRequired)
}
