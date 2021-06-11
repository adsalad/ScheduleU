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
    var Primary : Catalogue 
    var Secondary: Catalogue
    var allRequired : [Course]
    
    mutating func addTask(course: Course){
        allRequired.append(course)
    }
    
}
