//
//  ContentView.swift
//  ProgramProj
//
//  Created by Adam S on 2021-03-29.
//

import SwiftUI

struct ContentView: View {
     
    
    
    @ObservedObject var courseArray = CourseArray()
    @ObservedObject var worksheetArray = WorksheetArray()
    let catalogueArray : [Catalogue] = Bundle.main.decode("Catalogue.json")
    @Binding var showProfile : Bool
    @State var isTrue = false
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.977660954, green: 0.9901345372, blue: 0.9897318482, alpha: 1)), Color(#colorLiteral(red: 0.8521606326, green: 0.8600239158, blue: 0.8797453642, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                //.blur(radius: 8.0)
                
                VStack(alignment: .leading) {
                    
                    ScrollView(showsIndicators: false){
                        LazyVGrid(columns: columns, spacing: 21){
                            ForEach(worksheetArray.array){ item in
                                //NavigationLink(destination: NewView()){
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("\(item.Code)")
                                            .lineLimit(2)
                                            .font(.system(size: 40, weight: .bold, design: .rounded))
                                            .opacity(0.9)
                                            .foregroundColor(.white)
                                        
                                    }
                                    //.frame(width: 280)
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Text("\(item.Credit, specifier: "%.1f")")
                                            .font(.system(size: 26, weight: .light, design: .rounded))
                                            .foregroundColor(.white)
                                            .opacity(0.8)
                                        Spacer()
                                    }
                                    
                                }
                                .padding()
                                
                                .frame(width: UIScreen.main.bounds.size.width - 20, height: 120)
                                .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                                .cornerRadius(20)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0.0, y: 10)
                                
                                //}.buttonStyle(PlainButtonStyle())
                            }
                        }
                        .navigationBarItems(leading: AddButton(isTrue: $isTrue), trailing: AvatarView(showProfile: $showProfile)
                        )
                    }
                }
            }
        }.sheet(isPresented: $isTrue, content: {
            NewView(courseArray: self.courseArray, worksheetArray: self.worksheetArray)
        })
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(showProfile: .constant(false))
//    }
//}

struct AddButton: View {
    
    @Binding var isTrue : Bool
    var body: some View {
        Button(action: {self.isTrue = true}) {
            Image(systemName: "plus.magnifyingglass")
                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
        }
        .frame(width: 36, height: 36)
        .background(Color.orange)
        .cornerRadius(22)
    }
}

struct AvatarView: View {
    
    @Binding var showProfile : Bool
    
    var body: some View {
        Button(action: {self.showProfile.toggle()}) {
            Image("Avatar")
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}
