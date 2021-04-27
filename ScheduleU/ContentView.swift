//
//  ContentView.swift
//  ProgramProj
//
//  Created by Adam S on 2021-03-29.
//

import SwiftUI

struct Item : Identifiable {
    let id = UUID()
    let title : String
    let color : Color
    let image : String
    
    static func getItems() -> [Item] {
        (0...7).map {
            Item(title: "Item \($0)", color: [Color.blue].randomElement()!, image: "science")
        }
    }
}

//class Content : Identifiable, ObservableObject {
//    @Published var contentArray = [1,2,3,4,5,6,7]
//}


struct ContentView: View {
    
    //@ObservedObject var contentarr = Content()
    @State var isTrue = false
    private let items = Item.getItems()
    
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
                            ForEach(items){ item in
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
                                                Text(item.title)
                                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                                
                                                
                                                Text(item.title)
                                                    .font(.system(size: 16, weight: .light, design: .rounded))
                                                    .foregroundColor(.white)
                                                    .opacity(0.6)
                                            }
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
