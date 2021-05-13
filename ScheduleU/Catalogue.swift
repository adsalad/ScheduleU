//
//  Catalogue.swift
//  ScheduleU
//
//  Created by Adam S on 2021-04-26.
//

import Foundation

struct Catalogue : Codable {
    var Department : String 
    var MajorSpecMin : String
    var Degree : String
    var TotalCreditCount : Double
    var RequiredCourses: [String]
    var RequiredCourseDescription : String
}
