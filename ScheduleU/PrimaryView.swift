//
//  SignupView.swift
//  ScheduleU
//
//  Created by Adam S on 2021-06-20.
//

import SwiftUI

struct PrimaryView: View {
    
    @State private var name: String = ""
    
    var body: some View {
        VStack() {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(TextAlignment.center)
                .frame(width: 250, height: 60, alignment: .center)
                .background(Color.blue)
                .border(Color.black, width: 6)
                .cornerRadius(10.0)
            
            TextField("Enter your Student ID", text: $name)
                .multilineTextAlignment(TextAlignment.center)
                .frame(width: 250, height: 60, alignment: .center)
                .border(Color.black, width: 6)
                .cornerRadius(10.0)
        }
    }
}

struct PrimaryView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryView()
    }
}
