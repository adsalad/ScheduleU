//
//  InfoView.swift
//  ScheduleU
//
//  Created by Adam S on 2021-05-25.
//

import SwiftUI

struct InfoView: View {
    
    let course: Course
    @ObservedObject var courseArray : CourseArray
    @ObservedObject var worksheetArray : WorksheetArray
    
    var body: some View {
        VStack {
            Button(action: {
                worksheetArray.array.append(Course(id: 0, Name: "HAHA", Code: "LOL", Description: "LOL1", Credit: 3.0, AntiRequisites: [], PreRequisites: []))
            }) {
                Text("Add")
            }
            Text("\(course.Name)")
        }
    }
}

//struct InfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoView(course: CourseArrayStruct.array[0])
//    }
//}
