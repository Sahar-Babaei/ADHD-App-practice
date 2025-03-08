//
//  FakeTaskCard.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-03-03.
//

import SwiftUI

struct FakeTaskCard: View {
    
    // creating a variable of type FakeTask, so we can use its attributes when creating our card.
    
    var fTask : FakeTask
 
    
    //MARK: - body
    var body: some View {
        
        Text(fTask.fTaskName)
            .padding()
            .frame(maxWidth:.infinity , minHeight: 120)
            .background(Color.yellow.opacity(0.5))
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
