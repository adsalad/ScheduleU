//
//  ContentView.swift
//  ProgramProj
//
//  Created by Adam S on 2021-03-29.
//

import SwiftUI

struct ContentView: View {
    
    let courseArray : [Course] = Bundle.main.decode("Courses.json")
    @State var isTrue = false
    
    let columns = [
        GridItem(.flexible()),

    ]
  
    
    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9491309524, green: 0.9492898583, blue: 0.9491100907, alpha: 1)), Color(#colorLiteral(red: 0.835678637, green: 0.8395468593, blue: 0.8489992619, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                    //.blur(radius: 8.0)
                
                VStack(alignment: .leading) {
                    
                    
                    Group{
                        Text("Computer Science")
                        Text("5.0/6.0 Credits")
                        
                    }
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.leading, 16)
                    .offset(y: -15)
                    
                    ScrollView(showsIndicators: false){
                        LazyVGrid(columns: columns, spacing: 15){
                            ForEach(courseArray){ item in
                                NavigationLink(destination: NewView()){
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(height: 120)
                                            .foregroundColor(Color.blue)
                                            .padding(.top, 8)
                                            .padding(.leading, 12)
                                            .padding(.trailing, 12)
                                            .shadow(color: .black, radius: 6, x: 5, y: 5)
                            
                                        
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text(item.Name)
                                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                                
                                                Text("\(item.Credit)")
                                                    .font(.system(size: 15, weight: .light, design: .rounded))
                                                    .foregroundColor(.white)
                                                    .opacity(0.8)
                                        
                                    
                                            }.padding(.trailing, 16)
                                            .padding(.bottom, 30)
                                            Spacer()
                                        }.padding(.leading, 28)

                                    }
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }
                        .navigationBarItems(leading: AddButton(isTrue: $isTrue))
                    }
                    
                }
            }
        }.sheet(isPresented: $isTrue, content: {
            NewView()
        })
        
    }
}


struct AddButton: View {
    
    @Binding var isTrue : Bool
    var body: some View {
        Button(action: {self.isTrue = true}) {
            Image(systemName: "plus.app")
                .foregroundColor(.white)
        }
        .frame(width: 32, height: 32)
        .background(Color.orange)
        .cornerRadius(5)
    }
}
