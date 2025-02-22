//
//  Checkbox.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-02-20.
//

import SwiftUI

struct Checkbox: View {
    var boxChecked: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundStyle(.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 5)
                )
                .cornerRadius(10)
            Rectangle()
                .frame(width: 80, height: 80)
                .foregroundStyle(.blue)
            Image(systemName: "checkmark")
                .font(.system(size: 70))
                .foregroundStyle(.white)
            
        }
        
    }
}

#Preview {
    Checkbox()
}
