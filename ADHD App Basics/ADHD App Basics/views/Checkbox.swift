//
//  Checkbox.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-02-20.
//

import SwiftUI

struct Checkbox: View {
    @State public var isChecked : Bool
    var onChecked: (Bool) -> Void
    
    
 //   @Binding var isChecked: Bool
    var body: some View {
        
        Button(action: {
            isChecked.toggle()
            onChecked(isChecked)})
        {
            ZStack {
//                Rectangle()
//                    .frame(width: 100, height: 100)
//                    .foregroundStyle(.clear)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.gray, lineWidth: 5)
//                    )
//                    .cornerRadius(10)
//                Rectangle()
//                    .frame(width: 80, height: 80)
//                    .foregroundStyle(.blue)
//                Image(systemName: "checkmark")
//                    .font(.system(size: 70))
//                    .foregroundStyle(.white)
                Image(systemName: isChecked ? "checkmark.square.fill": "square")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(Color("CheckboxFill"))
                
            }
        }
        .buttonStyle(PlainButtonStyle())
        
    }
    
    
}

#Preview {
    Checkbox(isChecked: false, onChecked: {_ in })
}
    
