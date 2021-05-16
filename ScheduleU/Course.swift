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

struct CourseArrayStruct {
    static var array : [Course] = Bundle.main.decode("Courses.json")

}
