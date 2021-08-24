//
//  SignupView.swift
//  ScheduleU
//
//  Created by Adam S on 2021-06-20.
//

//think of dynamic array solutions
//add required course shit for both Primary and Seconday

import SwiftUI
import CoreMotion

struct PrimaryView: View {
    @State private var alertIsPresented = false
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
    let courseArray : [Course] = Bundle.main.decode("Courses.json")
    
    var disableButton: Bool {
        studentName.count < 2 || studentID.count < 9 || firstOptionString.isEmpty || secondOptionString.isEmpty
    }
        
    
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
                    
                    Text("Enter Your Full Name").font(.custom("Open Sans", size: 24).bold()) //
                            TextField("", text: $studentName)
                                .modifier(customTextModifier(roundedCornes: 6, startColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), endColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), textColor: .white))
        
                    Text("Enter your ID").font(.custom("Open Sans", size: 24).bold()) //
                    TextField("", text: $studentID)
                        .modifier(customTextModifier(roundedCornes: 6, startColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), endColor: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), textColor: .white))
                        .keyboardType(.decimalPad)
                
                    DropdownMenu(title: "Choose Primary Study", isExpanded: $firstDropdownExpanded, selectedOption: $firstOptionString, optionArray: $firstDropdownArray)
                    
                    DropdownMenu(title: "Choose Secondary Study", isExpanded: $secondDropdownExpanded, selectedOption: $secondOptionString, optionArray: $secondDropdownArray)
                }
                .padding(.top, 5.0)
                
               
                    //Button to move to next stage
                    Button(action: {
                        createStudent(alertIsPresented: &alertIsPresented, catalogueArray: catalogueArray, studentArray: &studentArray.array, firstOptionString: firstOptionString, secondOptionString: secondOptionString, studentID: studentID, studentName: studentName)
                        
                        addRequiredCourses(studentArray: &studentArray.array, courseArray: courseArray)
                        
                    }, label: {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(Color.white)
                    })
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                    .cornerRadius(40)
                    .opacity(disableButton ? 0 : 1)
                    .animation(.easeIn)
                    .padding(.top, 10)
    
            }.padding(20.0)
            
            //alert recieved boolean from createStudent function
            .alert(isPresented: $alertIsPresented, content: {
                Alert(
                    title: Text("Incorrect Program Selection!"),
                    message: Text("You cannot have the same program as both your Major, Specialization, or Minor"),
                    dismissButton: .default(Text("Got it!"))
                )
            })
        }
    }
}

struct PrimaryView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryView()
    }
}
