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
    
    @State private var showMenu: Bool = false
    @State private var showDeleteConfirmation: Bool = false
    
    // Function to delete a task, provided by TaskBankPage
    var onDelete: () -> Void
    
    
    //MARK: - body
    var body: some View {
        
        VStack(alignment: .leading){
            
            //tag and more
            HStack (alignment:.center) {
                
                //tag
                HStack(){
                    //Image("tag-icon")
                    Image(systemName: "tag")

                    
                        
                        
                       
                    
                    Text(fTask.fTaskCategory)
                        .font(Font.custom("Helvetica", size: 19))
                }
                Spacer()
                
                // three dots (more)
                Image(systemName: "ellipsis")
                    .font(.body)
            }
            
            
            //task name
            Text(fTask.fTaskName)
                .font(Font.custom("Instrument Sans", size: 21)) // Set the custom font
                    .fontWeight(.medium) // Apply weight separately
                    .foregroundColor(Color(red: 0.086, green: 0.09, blue: 0.09))

            
            //status
            HStack(alignment: .center, spacing: 5) {
                Circle()
                    .fill(Color(red: 0.53, green: 0.53, blue: 0.53))
                    .frame(width: 8, height: 8)
                
                Text(fTask.fTaskStatus)
                    .font(Font.custom("Helvetica", size: 17))
                    .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
            }
            .padding(.leading, 8)
            .padding(.trailing, 12)
            .padding(.vertical, 4)
            .background(.black.opacity(0.1))
            .cornerRadius(10)
        }
        //.background(Color.yellow)
        .background(Color(red: 1, green: 0.8, blue: 0.62))
        
        
        
        
        
        //                HStack {
        //                    Text(fTask.fTaskName)
        //                        .padding()
        //                        .frame(maxWidth: .infinity, alignment: .leading)
        //                        .lineLimit(2)
        //                        .truncationMode(.tail)  //adding ellipse
        //                        .background(Color.white)
        //
        //                    // "More" menu button
        //                    Menu {
        //                        Button("Edit") {
        //                            // Implement edit functionality here
        //                        }
        //                        Button("Delete", role: .destructive) {
        //                            showDeleteConfirmation = true
        //                        }
        //                    } label: {
        //                        Image(systemName: "ellipsis.circle")
        //                            .font(.title)
        //                            .padding()
        //                            .background(Color.green)
        //
        //                    }
        //                }
        //                .frame(maxWidth: .infinity, minHeight: 120)
        //                .background(Color.yellow.opacity(0.5))
        //                .cornerRadius(20)
        //                .overlay(
        //                    RoundedRectangle(cornerRadius: 20)
        //                        .stroke(Color.red, lineWidth: 2)
        //                )
        //                .confirmationDialog("Are you sure you want to delete this task?",
        //                                    isPresented: $showDeleteConfirmation,
        //                                    titleVisibility: .visible
        //                ) {
        //                    Button("Delete", role: .destructive) {
        //                        onDelete()
        //                    }
        //                    Button("Cancel", role: .cancel) { }
        //                }
    }
    
    
}




//MARK: - Preview
#Preview {
    FakeTaskCard(fTask: FakeTask(),onDelete: {})
}
