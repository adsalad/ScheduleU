//
//  Student.swift
//  ScheduleU
//
//  Created by Adam S on 2021-05-12.
//

import Foundation

struct Student : Identifiable {
    var id : Int
    var StudentName : String
    var Primary : Catalogue //mke minor
    var Secondary: Catalogue
    var CurrentCourses : [Course]
    
    mutating func addTask(course: Course){
        CurrentCourses.append(course)
    }
    
}
