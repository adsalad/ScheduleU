//
//  SignupView.swift
//  ScheduleU
//
//  Created by Adam S on 2021-06-20.
//

import SwiftUI
import CoreMotion

struct PrimaryView: View {
    @State private var firstExpanded = false
    @State private var secondExpanded = false
    @State private var firstOptionString = ""
    @State private var secondOptionString = ""
    @State var StudentName = ""
    @State var StudentID = ""
        
    
    var body: some View {
        ZStack {
            
            //Background
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9262614846, green: 0.9874219298, blue: 0.9875462651, alpha: 1)), Color(#colorLiteral(red: 0.8235294118, green: 0.8549019608, blue: 0.8980392157, alpha: 1))]),
                startPoint: UnitPoint(x: 0.2, y: 0.2),
                endPoint: .bottomTrailing
            ).ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                //Title
                Text("ScheduleU").font(.custom("Helvetica", size: 64)) //
                    .padding()
                    .shadow(radius: 1)
                    .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                
                //Textboxes & Dropdown & Button
                VStack(alignment: .leading) {
                    
                    Text("Enter Your Name").font(.custom("Open Sans", size: 24).bold()) //
                    TextField("", text: $StudentName)
                        .modifier(customTextModifier(roundedCornes: 6, startColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), endColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), textColor: .white))
                    
                    Text("Enter your ID").font(.custom("Open Sans", size: 24).bold()) //
                    TextField("", text: $StudentID)
                        .modifier(customTextModifier(roundedCornes: 6, startColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), endColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), textColor: .white))
                        
                
                    Dropdown(title: "Choose Primary Study", isExpanded: $firstExpanded, selectedOption: $firstOptionString)
                    
                    Dropdown(title: "Choose Seconday Study", isExpanded: $secondExpanded, selectedOption: $secondOptionString)
                }
                Button(action: {
                }, label: {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(Color.white)
                })
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                .cornerRadius(40)
                .opacity(secondOptionString.isEmpty ? 0 : 1)
                .animation(.easeIn)
                .padding(.top, 10)
            }.padding(20.0) //
        }
    }
}

struct Dropdown: View {
    var title: String
    @Binding var isExpanded: Bool
    @Binding var selectedOption : String
    
    //Convert this to dynamic array through JSON or CoreData, this is a sample for now to make sure things work
    var optionArray = ["Computer Science, Major", "History, Major"]
    
    
    
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
                                    isExpanded = false
                                    let option = option.components(separatedBy: ", ")
                                    print(option)
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


struct PrimaryView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryView()
    }
}
