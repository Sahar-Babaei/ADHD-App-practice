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
    
    //todo: mentor: why did chatgpt suggest a private variable?
    @State private var showMenu: Bool = false       // private variable is the default, think of it as the objects should not be able to know everything about each other. like a safeguard to keep other users from touching it.
    @State private var showDeleteConfirmation: Bool = false
    
    // Function to delete a task, provided by TaskBankPage
       var onDelete: () -> Void
    
    //MARK: - body
    var body: some View {
           
                HStack {
                    Text(fTask.fTaskName)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(2)
                        .truncationMode(.tail)  //adding ellipse
                        .background(Color.white)

                    // "More" menu button
                    Menu {
                        Button("Edit") {
                            // Implement edit functionality here
                        }
                        Button("Delete", role: .destructive) {
                            showDeleteConfirmation = true
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 120)
                .background(Color.yellow.opacity(0.5))
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 2)
                )
                .confirmationDialog("Are you sure you want to delete this task?",
                                    isPresented: $showDeleteConfirmation,
                                    titleVisibility: .visible
                ) {
                    Button("Delete", role: .destructive) {
                        onDelete()
                    }
                    Button("Cancel", role: .cancel) { }
                }
            }
        }
    





//MARK: - Preview
#Preview {
    FakeTaskCard(fTask: FakeTask(),onDelete: {})
}
