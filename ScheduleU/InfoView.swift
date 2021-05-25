//
//  InfoView.swift
//  ScheduleU
//
//  Created by Adam S on 2021-05-25.
//

import SwiftUI

struct InfoView: View {
    
    let course: Course
    
    var body: some View {
        Text("\(course.Name)")
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(course: CourseArrayStruct.array[0])
    }
}
