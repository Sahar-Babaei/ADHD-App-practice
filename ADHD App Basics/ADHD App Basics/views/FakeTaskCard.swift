//
//  FakeTaskCard.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-03-03.
//

import SwiftUI

struct FakeTaskCard: View {
    
    var fTask : FakeTask
 
    
    //MARK: - body
    var body: some View {
        
        Text(fTask.fTaskName)
            .frame(maxWidth:.infinity , minHeight: 120)
            .background(Color.yellow)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 2)
            )
        
       
    }
}



//MARK: - Preview
#Preview {
    FakeTaskCard(fTask: FakeTask())
}
