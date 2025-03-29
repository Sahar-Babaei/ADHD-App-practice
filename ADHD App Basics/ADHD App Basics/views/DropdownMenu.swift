//
//  DropdownMenu.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-03-29.
//

import SwiftUI

struct DropdownMenu: View {
    @State private var isExpanded: Bool = false
      @State private var selectedOption: String = "Select an Option"
      let options = ["Not Started", "Planned for Today", "Complete"]

      var body: some View {
        DisclosureGroup(selectedOption, isExpanded: $isExpanded) {
            VStack (alignment: .leading) {
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
                .background(Color("GreyStatusBackground"))
                .cornerRadius(15)
//              Text(option)
//                .padding()
                .onTapGesture {
                  selectedOption = option
                  isExpanded = false
                
                }
            }
          }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
      }
}

#Preview {
    DropdownMenu()
}
