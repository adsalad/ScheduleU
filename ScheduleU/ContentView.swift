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
                        LazyVGrid(columns: columns, spacing: 20){
                            ForEach(courseArray){ item in
                                NavigationLink(destination: NewView()){
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text(item.Name)
                                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                                    
                                            }
                                            
                                            Spacer()
                                            
                                            VStack {
                                                Text("\(item.Credit, specifier: "%.1f")")
                                                    .font(.system(size: 22, weight: .light, design: .rounded))
                                                    .foregroundColor(.white)
                                                    .opacity(0.8)
                                                Spacer()
                                            }
                                    
                                        }
                                        .padding()

                                        .frame(width: UIScreen.main.bounds.size.width - 20, height: 120)
                                        .background(Color.blue)
                                        .cornerRadius(20)
                                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0.0, y: 7.5)


                                    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
