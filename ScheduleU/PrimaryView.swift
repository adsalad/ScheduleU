//
//  SignupView.swift
//  ScheduleU
//
//  Created by Adam S on 2021-06-20.
//

import SwiftUI
import CoreMotion

struct PrimaryView: View {
    @State private var firstDropdownExpanded = false
    @State private var secondDropdownExpanded = false
    @State var firstDropdownArray = ["Computer Science, Major", "History, Major"]
    @State var secondDropdownArray = ["Computer Science, Minor", "History, Minor"]
    @State private var firstOptionString = ""
    @State private var secondOptionString = ""
    @State var studentName = ""
    @State var studentID = ""
    
    @ObservedObject var studentArray = StudentArray()
    let catalogueArray : [Catalogue] = Bundle.main.decode("Catalogue.json")

        
    var body: some View {
        ZStack {
            
            //Background
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9262614846, green: 0.9874219298, blue: 0.9875462651, alpha: 1)), Color(#colorLiteral(red: 0.8235294118, green: 0.8549019608, blue: 0.8980392157, alpha: 1))]),
                startPoint: UnitPoint(x: 0.2, y: 0.2),
                endPoint: .bottomTrailing
            ).ignoresSafeArea()
            
            VStack(spacing: 15) {
                
                //Title
                Text("ScheduleU").font(.custom("Helvetica", size: 64)) //
                    .padding()
                    .shadow(radius: 1)
                    .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                
                //Textboxes & Dropdown & Button
                VStack(alignment: .leading, spacing: 12.0) {
                    
                    Text("Enter Your Name").font(.custom("Open Sans", size: 24).bold()) //
                    TextField("", text: $studentName)
                        .modifier(customTextModifier(roundedCornes: 6, startColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), endColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), textColor: .white))
                    
                    Text("Enter your ID").font(.custom("Open Sans", size: 24).bold()) //
                    TextField("", text: $studentID)
                        .modifier(customTextModifier(roundedCornes: 6, startColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), endColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), textColor: .white))
                        
                
                    Dropdown(title: "Choose Primary Study", isExpanded: $firstDropdownExpanded, selectedOption: $firstOptionString, optionArray: $firstDropdownArray)
                    
                    Dropdown(title: "Choose Seconday Study", isExpanded: $secondDropdownExpanded, selectedOption: $secondOptionString, optionArray: $secondDropdownArray)
                }
                .padding(.top, 5.0)
                Button(action: {
                    //turn this into an extension
                    let firstOptionArray = firstOptionString.components(separatedBy: ", ")
                    let secondOptionArray = secondOptionString.components(separatedBy: ", ")
                    favoriteAlbum(catalogueArray: catalogueArray, studentArray: &studentArray.array, firstOptionArray: firstOptionArray, secondOptionArray: secondOptionArray, studentID: studentID, studentName: studentName)
                    
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

func favoriteAlbum(catalogueArray : [Catalogue], studentArray: inout [Student] , firstOptionArray : [String], secondOptionArray : [String], studentID : String, studentName : String ) {
    
    let major = catalogueArray.firstIndex(where: {$0.Degree == firstOptionArray[0] && $0.MajorSpecMin == firstOptionArray[1]})
    let minor = catalogueArray.firstIndex(where: {$0.Degree == secondOptionArray[0] && $0.MajorSpecMin == secondOptionArray[1]})
    let studentOne = Student(id: Int(studentID) ?? 0, StudentName: studentName, Primary: catalogueArray[major ?? 0], Secondary: catalogueArray[minor ?? 0], allRequired: [])
    studentArray.append(studentOne)
}

struct Dropdown: View {
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


struct PrimaryView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryView()
    }
}
