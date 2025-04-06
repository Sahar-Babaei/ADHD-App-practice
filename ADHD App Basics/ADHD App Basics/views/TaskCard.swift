//
//  FakeTaskCard.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-03-03.
//

import SwiftUI

struct TaskCard: View {
    
    // creating a variable of type FakeTask, so we can use its attributes when creating our card.
    var fTask : Task
    var chosenHeight: CGFloat
    var chosenSpacing: CGFloat
    @State private var showMenu: Bool = false
    @State private var showDeleteConfirmation: Bool = false
    @StateObject var storageViewModel = TaskBankViewModel()
    // Function to delete a task, provided by TaskBankPage
    var onDelete: () -> Void
    
  
    
    //MARK: - body
    var body: some View {
        
        //card
        VStack(alignment: .leading){
            
            //tag and title
            VStack(alignment: .leading, spacing: chosenSpacing){
                
                //tag and more
                HStack (alignment:.center) {
                    
                    //tag
                    HStack(spacing:4){
                        
                        Image(systemName: "tag")
                            .font(.system(size: 13))
                            .foregroundColor(fTask.tag.color)
                        
                        Text(fTask.tag.name)
                            .font(Font.custom("Helvetica", size: 14))
                            .foregroundColor(fTask.tag.color)
                    }
                    
                    
                    Spacer()
                    
                    // three dots (more)
                    //
                    //                    Image(systemName: "ellipsis")
                    //                        .font(.body)
                    
                    // "More" menu button
                    Menu {
                        
                        Button("Edit") {
                            // Implement edit functionality here
                        }
                        Button("Delete", role: .destructive) {
                            showDeleteConfirmation = true
                            
                            storageViewModel.removeTask(fTask)
                            
                            
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.body)
                            .padding(.leading,15)
                            .padding(.trailing,3)
                            .padding(.vertical,12)
                            
                       
                            .foregroundColor(Color("BodyCopy"))
                        
                    }
                    
                    
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
                
                
                
                
                
                //task name
                Text(fTask.name)
                    .font(Font.custom("Instrument Sans", size: 16)) // Set the custom font
                    .fontWeight(.medium) // Apply weight separately
                    .foregroundColor(Color("BodyCopy"))
                    .lineLimit(2)
                    .truncationMode(.tail)
                    
                    
                
                
            }
         //   .background(.green)
            
            Spacer()
            
            //status
            HStack(alignment: .center, spacing: 5) {
                Circle()
                    .fill(fTask.status.bodyColor)
                    .frame(width: 8, height: 8)
                
                Text(fTask.status.name)
                    .font(Font.custom("Helvetica", size: 13))
                    .foregroundColor(fTask.status.bodyColor)
            }
            .padding(.leading, 8)
            .padding(.trailing, 12)
            .padding(.vertical, 4)
            .background(fTask.status.backgroundColor)
            .cornerRadius(15)
          //  .background(.blue)
            
        }
        .frame(height:chosenHeight)
        .padding(12)
        
        .background(Color("MainForeground"))
        //.background(.green)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
        
        
        
    }
    
    
}




//MARK: - Preview
#Preview {
    TaskCard(fTask: Task(), chosenHeight: 120,chosenSpacing: 10,onDelete: {})
}
