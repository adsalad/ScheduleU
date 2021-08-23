//
//  CustomViews.swift
//  ScheduleU
//
//  Created by Adam S on 2021-08-23.
//

import SwiftUI

struct DropdownMenu: View {
    var title: String
    @Binding var isExpanded: Bool
    @Binding var selectedOption : String
    
    //Convert this to dynamic array through JSON or CoreData, this is a sample for now to make sure things work
    @Binding var optionArray : [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title)")
                .font(.custom("Open Sans", size: 24).bold()) //
            DisclosureGroup("\(selectedOption)", isExpanded: $isExpanded) {
                ScrollView(showsIndicators: false) {
                        ForEach(optionArray, id: \.self){ option in
                            Text("\(option)")
                                .font(.title3)
                                .padding(.all)
                                .onTapGesture {
                                    self.selectedOption = option
                                    isExpanded.toggle()
                                }
                    }
                }.frame(height: 150)
            }
            .accentColor(.white)
            .font(.title2)
            .foregroundColor(.white)
            .padding(.all)
            .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
            .cornerRadius(6)
            .shadow(radius: 10)
        }
    }
}

struct customTextModifier: ViewModifier {
    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .padding(3)
            .foregroundColor(textColor)
            .font(.custom("Open Sans", size: 18))
            .shadow(radius: 10)
    }
}
