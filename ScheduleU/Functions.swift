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

func createStudent(catalogueArray : [Catalogue], studentArray: inout [Student] , firstOptionString : String, secondOptionString : String, studentID : String, studentName : String ) {
    
    let firstOptionArray = firstOptionString.splitByComma
    let secondOptionArray = secondOptionString.splitByComma
    
    let major = catalogueArray.firstIndex(where: {$0.Degree == firstOptionArray[0] && $0.MajorSpecMin == firstOptionArray[1]})
    let minor = catalogueArray.firstIndex(where: {$0.Degree == secondOptionArray[0] && $0.MajorSpecMin == secondOptionArray[1]})
    let studentOne = Student(id: Int(studentID) ?? 0, StudentName: studentName, Primary: catalogueArray[major ?? 0], Secondary: catalogueArray[minor ?? 0], allRequired: [])
    studentArray.append(studentOne)
    print(studentArray)
}
