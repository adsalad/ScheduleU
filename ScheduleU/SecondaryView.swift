//
//  SecondaryView.swift
//  ScheduleU
//
//  Created by Adam S on 2021-06-21.
//

import SwiftUI

struct SecondaryView: View {
    @State var StudentName : String
    @State var StudentID : String
    

    var body: some View {
        Text("Hello, World!")
    }
}

struct SecondaryView_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryView(StudentName: "Adam", StudentID: "251035776" )
    }
}
