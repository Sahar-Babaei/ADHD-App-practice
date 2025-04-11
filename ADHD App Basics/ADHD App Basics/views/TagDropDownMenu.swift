//
//  TagDropDownMenu.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-03-31.
//

import SwiftUI

struct TagDropDownMenu: View {
    
    @State private var isExpanded: Bool = false
    @Binding var selectedTag: Tag
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    HStack(alignment: .center) {
                        Image(systemName: "tag")
                            .foregroundColor(selectedTag.color)
                        Text(selectedTag.name) // Display selected status
                            .font(Font.custom("Helvetica", size: 15))
                            .foregroundColor(selectedTag.color)
                    }
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundColor(Color("GreyStatusBody"))
                        .padding(6)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                .background(Color("FieldBackground"))
                .cornerRadius(12)
                
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(isExpanded ? Color("BodyCopy").opacity(0.2): Color(.clear)),
                    alignment: .bottom
                )
            }
            .buttonStyle(PlainButtonStyle())
            
            if isExpanded {
                ForEach(Tag.allCases, id: \.self) { tag in
//                    ZStack(alignment: .leading){
//                        Rectangle()
//                            .fill(.clear)
//                            .frame(width:.infinity, height: 40)
//                            .padding(0)
                        HStack(alignment: .center) {

                            Image(systemName: "tag")
                                .font(.system(size: 14))
                                .foregroundColor(tag.color)
                            Text(tag.name) // Use enum-defined name
                                .font(Font.custom("Helvetica", size: 14))
                                .foregroundColor(tag.color)
                        }
                        .padding(.leading, 8)
                        .padding(.trailing, 12)
                        .padding(.vertical, 1)
                         // Use enum-defined background color
                        
                        .frame(maxWidth: .infinity, maxHeight:40, alignment: .leading)
                        .background(.clear)
                        .cornerRadius(12)
                        .padding(.leading, 20)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedTag = tag
                            isExpanded = false
                    }
                    //.transition(.opacity.combined(with: .slide))
                    
//                    }
                    
                    //.padding(.vertical, 4)
                    .padding(.top,5)
                    .padding(.bottom,5)
                }
                .padding(.bottom,6)
            }
            
        }
        //.background(Color.gray.opacity(0.1))
        .background(Color("FieldBackground"))
        .cornerRadius(12)
        
    }
}

// Test View
struct aView: View {
    @State private var selectedTag: Tag = .none // Define a state variable
    var body: some View {
        VStack(spacing: 20) {
            TagDropDownMenu(selectedTag: $selectedTag) // Pass as binding
        }
        .padding()
    }
}

struct aView_Previews: PreviewProvider {
    static var previews: some View {
        aView()
    }
}

