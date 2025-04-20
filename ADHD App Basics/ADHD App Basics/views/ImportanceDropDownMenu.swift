//
//  ImportanceDropDownMenu.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-04-20.
//

import SwiftUI

struct ImportanceDropDownMenu: View {
    
    @State private var isExpanded: Bool = false
    @Binding var selectedImportance: Importance
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(selectedImportance.name)
                        .font(Font.custom("Helvetica", size: 15))
                        .foregroundColor(selectedImportance.color)

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
                ForEach(Importance.allCases, id: \.self) { importance in
                    HStack {
                        Text(importance.name)
                            .font(Font.custom("Helvetica", size: 14))
                            .foregroundColor(importance.color)
                    }
                    .padding(.leading, 8)
                    .padding(.trailing, 12)
                    .padding(.vertical, 1)
                    .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
                    .background(.clear)
                    .cornerRadius(12)
                    .padding(.leading, 20)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedImportance = importance
                        isExpanded = false
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                }
                .padding(.bottom, 6)
            }
        }
        .background(Color("FieldBackground"))
        .cornerRadius(12)
    }
}


struct ImportanceTestView: View {
    @State private var selectedImportance: Importance = .asap
    
    var body: some View {
        VStack(spacing: 20) {
            ImportanceDropDownMenu(selectedImportance: $selectedImportance)
        }
        .padding()
    }
}

struct ImportanceTestView_Previews: PreviewProvider {
    static var previews: some View {
        ImportanceTestView()
    }
}

