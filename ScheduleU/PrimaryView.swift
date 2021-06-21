//
//  SignupView.swift
//  ScheduleU
//
//  Created by Adam S on 2021-06-20.
//

import SwiftUI
import CoreMotion


extension Color {
    static let lightShadow = Color(#colorLiteral(red: 0.3435087204, green: 0.3425679505, blue: 0.756269455, alpha: 1))
    static let darkShadow = Color(#colorLiteral(red: 0.2509803922, green: 0.04705882353, blue: 0.6862745098, alpha: 1))
    static let background = Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    static let neumorphictextColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
}

struct PrimaryView: View {
    @State var StudentName = ""
    @State var StudentID = ""
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack(spacing: 34.0) {
                
                VStack(alignment: .leading, spacing: 14.0) {
                    Text("Enter Your Name")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8022040563)))
                    
                    NeumorphicStyleTextField(textField: TextField("Ex. Adam", text: $StudentName))
                }
                
                
                VStack(alignment: .leading, spacing: 14.0) {
                    Text("Enter Your Student ID")
                        .font(.system(size: 24, weight: .bold, design: .rounded))                  .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7954004553)))
                    NeumorphicStyleTextField(textField: TextField("Ex. 2519034212", text: $StudentID))
                        .keyboardType(.decimalPad)

                }
                
               
                    Button(action: {}, label: {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                    })
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .cornerRadius(40)
                    .opacity(StudentID.count <= 6 ? 0 : 1)
                    .animation(.easeIn)

                
            }.padding(30.0)
        }
    }
}

struct NeumorphicStyleTextField: View {
    var textField: TextField<Text>
    var body: some View {
        textField
            .font(.system(size: 18, weight: .medium, design: .rounded))
            .padding()
            .foregroundColor(.white)
            .background(Color.background)
            .cornerRadius(6)
            .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
            .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
    }
}

struct PrimaryView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryView()
    }
}
