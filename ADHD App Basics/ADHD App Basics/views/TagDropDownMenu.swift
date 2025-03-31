//
//  TagDropDownMenu.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-03-31.
//

import SwiftUI

struct TagDropDownMenu: View {
    
    @State private var isExpanded: Bool = false
    @State private var selectedTag: Tag = .none
    
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
                            .font(Font.custom("Helvetica", size: 14))
                            .foregroundColor(selectedTag.color)
                    }
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
                ForEach(Tag.allCases, id: \.self) { tag in
                    HStack(alignment: .center) {

                        Image(systemName: "tag")
                            .foregroundColor(tag.color)
                        Text(tag.name) // Use enum-defined name
                            .font(Font.custom("Helvetica", size: 14))
                            .foregroundColor(tag.color)
                    }
                    .padding(.leading, 8)
                    .padding(.trailing, 12)
                    .padding(.vertical, 4)
                    .background(.clear) // Use enum-defined background color
                    .cornerRadius(15)
                    .padding(.leading, 20)
                    .transition(.opacity.combined(with: .slide))
                    .onTapGesture {
                        selectedTag = tag
                        isExpanded = false
                    }
                    .padding()
                }
            }
        }
    }
}


#Preview {
    TagDropDownMenu()
}
