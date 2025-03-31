//
//  DropdownMenu.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-03-29.
//

import SwiftUI
import SwiftUICore
//struct DropdownMenu: View {
//    @State private var isExpanded: Bool = false
//      @State private var selectedOption: String = "Select an Option"
//      let options = ["Not Started", "Planned for Today", "Complete"]
//
//      var body: some View {
//        DisclosureGroup(selectedOption, isExpanded: $isExpanded) {
//            VStack (alignment: .leading) {
//            ForEach(options, id: \.self) { option in
//                HStack(alignment: .center) {
//                    Circle()
//                        .fill(Color("GreyStatusBody"))
//                        .frame(width: 8, height: 8)
//                    
//                    Text(option)
//                        .font(Font.custom("Helvetica", size: 13))
//                        .foregroundColor(Color("GreyStatusBody"))
//                }
//                .padding(.leading, 8)
//                .padding(.trailing, 12)
//                .padding(.vertical, 4)
//                .background(Color("GreyStatusBackground"))
//                .cornerRadius(15)
////              Text(option)
////                .padding()
//                .onTapGesture {
//                  selectedOption = option
//                  isExpanded = false
//                
//                }
//            }
//          }
//        }
//        .padding()
//        .background(Color.gray.opacity(0.1))
//        .cornerRadius(8)
//      }
//}
//
//#Preview {
//    DropdownMenu()
//}



struct CustomDisclosureGroup: View {
    @State private var isExpanded: Bool = false
    @State private var selectedOption: String = "Select an Option"
//    @State var status : Status
let options = ["Not Started", "Planned for Today", "Complete"]
//    let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    
                    HStack(alignment: .center) {
                        Circle()
                            .fill(Color("GreyStatusBody"))
                            .frame(width: 8, height: 8)
                        
                        Text(selectedOption)
                            .font(Font.custom("Helvetica", size: 13))
                            .foregroundColor(Color("GreyStatusBody"))
                    }
                    .padding(.leading, 8)
                    .padding(.trailing, 12)
                    .padding(.vertical, 4)
                    .background(Color("GreyStatusBackground"))
                    .cornerRadius(15)
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundColor(Color("GreyStatusBody"))
                        .padding(6)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            .buttonStyle(PlainButtonStyle())

            if isExpanded {
                ForEach(options, id: \.self) { option in
                    HStack(alignment: .center) {
                        Circle()
                            .fill(Color("GreyStatusBody"))
                            .frame(width: 8, height: 8)
                        
                        Text(option)
                            .font(Font.custom("Helvetica", size: 13))
                            .foregroundColor(Color("GreyStatusBody"))
                    }
                    .padding(.leading, 8)
                    .padding(.trailing, 12)
                    .padding(.vertical, 4)
                    .background(Color(Color("GreyStatusBackground")))
                    .cornerRadius(15)
                    .padding(.leading, 20)
                    .transition(.opacity.combined(with: .slide))
                    .onTapGesture {
                        selectedOption = option
                      isExpanded = false
    
                    }
                    .padding()
                }
                
                
                //MARK: in progress
//                ForEach(status, id: \.self) { status in
//                    HStack(alignment: .center) {
//                        Circle()
//                            .fill(Color("GreyStatusBody"))
//                            .frame(width: 8, height: 8)
//                        
//                        Text(status.name)
//                            .font(Font.custom("Helvetica", size: 13))
//                            .foregroundColor(Color("GreyStatusBody"))
//                    }
//                    .padding(.leading, 8)
//                    .padding(.trailing, 12)
//                    .padding(.vertical, 4)
//                    .background(Color(Color("GreyStatusBackground")))
//                    .cornerRadius(15)
//                    .padding(.leading, 20)
//                    .transition(.opacity.combined(with: .slide))
//                    .onTapGesture {
//                        selectedOption = status.name
//                      isExpanded = false
//    
//                    }
//                    .padding()
//                }
                
                
                
//                VStack{
//                    HStack(alignment: .center) {
//                        Circle()
//                            .fill(Color("GreyStatusBody"))
//                            .frame(width: 8, height: 8)
//                        
//                        Text("Not Started")
//                            .font(Font.custom("Helvetica", size: 13))
//                            .foregroundColor(Color("GreyStatusBody"))
//                    }
//                    .padding(.leading, 8)
//                    .padding(.trailing, 12)
//                    .padding(.vertical, 4)
//                    .background(Color(.yellow))
//                    .cornerRadius(15)
//                    .padding(.leading, 20)
//                    .transition(.opacity.combined(with: .slide))
//                    .onTapGesture {
//                      selectedOption = option
//                      isExpanded = false
//    
//                    }
//                }
                   
            }
               
        }
    }
        
}



struct myView: View {
    var body: some View {
        VStack(spacing: 20) {
            CustomDisclosureGroup()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        myView()
    }
}
