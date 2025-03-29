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
    
    @State private var showMenu: Bool = false
    @State private var showDeleteConfirmation: Bool = false
    @StateObject var storageViewModel = TaskBankViewModel()
    // Function to delete a task, provided by TaskBankPage
    var onDelete: () -> Void
    
    //TODO: Create a variable that lets us set the height of the card depending on whether it is in list view or 2 column view
    
    //MARK: - body
    var body: some View {
        
        //card
        VStack(alignment: .leading, spacing: 22){
            
            //tag and title
            VStack(alignment: .leading, spacing:10){
                
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
                    Image(systemName: "ellipsis")
                        .font(.body)
                }
                //.background(.green)
                
                
                
                //task name
                Text(fTask.name)
                    .font(Font.custom("Instrument Sans", size: 16)) // Set the custom font
                    .fontWeight(.medium) // Apply weight separately
                    .foregroundColor(Color("BodyCopy"))
                
            }
            //.background(.yellow)
            
            
            //status
            HStack(alignment: .center, spacing: 5) {
                Circle()
                    .fill(Color("GreyStatusBody"))
                    .frame(width: 8, height: 8)
                
                Text(fTask.status)
                    .font(Font.custom("Helvetica", size: 13))
                    .foregroundColor(Color("GreyStatusBody"))
            }
            .padding(.leading, 8)
            .padding(.trailing, 12)
            .padding(.vertical, 4)
            .background(Color("GreyStatusBackground"))
            .cornerRadius(15)
            
        }
        .padding(12)
        .background(Color("MainForeground"))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
//        
        
        
        
        

//                        HStack {
//                            Text(fTask.name)
//                                .padding()
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .lineLimit(2)
//                                .truncationMode(.tail)  //adding ellipse
//                                .background(Color.white)
//        
//                            // "More" menu button
//                            Menu {
//                                
//                                Button("Edit") {
//                                    // Implement edit functionality here
//                                }
//                                Button("Delete", role: .destructive) {
//                                    showDeleteConfirmation = true
//                            
//                                    storageViewModel.removeTask(fTask)
//                                    
//                                    
//                                }
//                            } label: {
//                                Image(systemName: "ellipsis.circle")
//                                    .font(.title)
//                                    .padding()
//                                    .background(Color.green)
//        
//                            }
//                        }
//                        .frame(maxWidth: .infinity, minHeight: 120)
//                        .background(Color.yellow.opacity(0.5))
//                        .cornerRadius(20)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                                .stroke(Color.red, lineWidth: 2)
//                        )
//                        .confirmationDialog("Are you sure you want to delete this task?",
//                                            isPresented: $showDeleteConfirmation,
//                                            titleVisibility: .visible
//                        ) {
//                            Button("Delete", role: .destructive) {
//                                onDelete()
//                            }
//                            Button("Cancel", role: .cancel) { }
//                        }

//                        HStack {
//                            Text(fTask.name)
//                                .padding()
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .lineLimit(2)
//                                .truncationMode(.tail)  //adding ellipse
//                                .background(Color.white)
//        //MARK: - this part?
//                            // "More" menu button
//                            Menu {
//                                
//                                Button("Edit") {
//                                    // Implement edit functionality here
//                                }
//                                Button("Delete", role: .destructive) {
//                                    showDeleteConfirmation = true
//                            
//                                    storageViewModel.removeTask(fTask)
//                                    
//                                    
//                                }
//                            } label: {
//                                Image(systemName: "ellipsis.circle")
//                                    .font(.title)
//                                    .padding()
//                                    .background(Color.green)
//        
//                            }
//                            //MARK: - this part?
//                        }
//                        .frame(maxWidth: .infinity, minHeight: 120)
//                        .background(Color.yellow.opacity(0.5))
//                        .cornerRadius(20)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                                .stroke(Color.red, lineWidth: 2)
//                        )
//                        .confirmationDialog("Are you sure you want to delete this task?",
//                                            isPresented: $showDeleteConfirmation,
//                                            titleVisibility: .visible
//                        ) {
//                            Button("Delete", role: .destructive) {
//                                onDelete()
//                            }
//                            Button("Cancel", role: .cancel) { }
//                        }

    }
    
    
}




//MARK: - Preview
#Preview {
    TaskCard(fTask: Task(),onDelete: {})
}
