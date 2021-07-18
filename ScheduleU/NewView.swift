//
//  NewView.swift
//  Bullshit
//
//  Created by Adam S on 2021-03-29.
//

import SwiftUI



struct NewView: View {
    @State private var searchData = ""
    @ObservedObject var courseArray : CourseArray
    @ObservedObject var worksheetArray : WorksheetArray
    @Environment(\.presentationMode) var dismissSheet


    var body: some View {
        
        NavigationView{
            VStack {
                SearchBar(text: $searchData)
                    .padding([.leading, .trailing], 12)
                    .padding(.top, 14)
                List(courseArray.array.filter({ searchData.isEmpty ? true : $0.Code.contains(searchData.uppercased()) || $0.Name.contains(searchData.uppercased())
                })) {
                    item in
                    NavigationLink(destination: InfoView(course: item, courseArray: courseArray, worksheetArray: worksheetArray)){
                        LazyVStack (alignment: .leading) {
                            Text(item.Name).font(.system(.subheadline, design: .rounded))
                        }
                    }
                }.listStyle(PlainListStyle())
            }.navigationBarTitle("Search Courses")
            //.navigationBarHidden(true)
            .navigationBarItems(trailing: Button(action: {dismissSheet.wrappedValue.dismiss()}, label: {
                Text("Exit")
            }))
        }
    }
    
    struct SearchBar: View {
        @Binding var text: String
        
        var body: some View {
            HStack{
                Image(systemName: "magnifyingglass").foregroundColor(.black)
                TextField("Search", text: $text)
                Spacer(minLength: 0)
                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundColor(Color(UIColor.systemGray6))
                            .frame(width: 8, height: 8)
                            .background(Circle().foregroundColor(Color(UIColor.systemGray6)))
                            .frame(width: 16, height: 16)
                    }
                }
                
            }.padding(8)
            .padding([.leading, .trailing], 6)
            .background(RoundedRectangle(cornerRadius: 30).foregroundColor(Color(UIColor.systemGray6)))
            .frame(maxWidth: .infinity)
        }
    }
    
//    struct NewView_Previews: PreviewProvider {
//        static var previews: some View {
//            NewView(courseArray: CourseArrayStruct.array)
//        }
//    }
}
