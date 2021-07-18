//
//  SignupView.swift
//  ScheduleU
//
//  Created by Adam S on 2021-06-20.
//

import SwiftUI
import CoreMotion



struct PrimaryView: View {
    @State private var isExpanded = false
    
    
    @State var StudentName = ""
    @State var StudentID = ""
    
    
    var body: some View {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [.white, Color(#colorLiteral(red: 0.8235294118, green: 0.8549019608, blue: 0.8980392157, alpha: 1))]),
                startPoint: UnitPoint(x: 0.2, y: 0.2),
                endPoint: .bottomTrailing
            ).ignoresSafeArea()
            
            VStack(spacing: 10) { //
                
                VStack(alignment: .leading) {
                    Text("Enter Your Name").font(.custom("Open Sans", size: 24).bold()) //
                    
                    
                    TextField("Search...", text: $StudentName)
                        .modifier(customViewModifier(roundedCornes: 6, startColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), endColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), textColor: .white))
                    
                    Text("Enter your ID").font(.custom("Open Sans", size: 24).bold()) //
                    
                    TextField("Search...", text: $StudentID)
                        .modifier(customViewModifier(roundedCornes: 6, startColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), endColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), textColor: .white))
                    
                    Dropdown(isExpanded: $isExpanded)
                    
                }
                
                Button(action: {
                }, label: {
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
            }.padding(20.0) //
        }
    }
}

struct Dropdown: View {
    
    @Binding var isExpanded: Bool
    @State var selectedOption = 1
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Number of lines")
                .font(.custom("Open Sans", size: 24).bold()) //
            DisclosureGroup("\(selectedOption)", isExpanded: $isExpanded) {
                ScrollView(showsIndicators: false) {
                    VStack{
                        ForEach(1...500, id: \.self){ option in
                            Text("\(option)")
                                .font(.title3)
                                .padding(.all)
                                .onTapGesture {
                                    self.selectedOption = option
                                    isExpanded = false
                                }
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


struct customViewModifier: ViewModifier {
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


struct PrimaryView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryView()
    }
}
