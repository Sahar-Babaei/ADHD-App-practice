//
//  TaskBankPage.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-03-03.
//

import SwiftUI

struct TaskBankPage: View {
    
    //@State means SwiftUI will automatically update the screen when the list changes
    @State var allTasksList : [FakeTask] = []
    @State var userTaskTitle : String = ""
    @State var showTextFieldOverlay : Bool = false
    
    
    //important: can't create functions in body. body is a special property that returns views
    var body: some View {
        
        VStack{
            
            //Add task Button
            HStack{
                Spacer()
                
                Button(action: {showTextFieldOverlay=true}) {
                    Text("Add New Task +")
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 12)
            
            
            
            
            //for loop to show Task cards
            ScrollView{
                //LazyVStack only loads what's on the screen.
                
                LazyVStack(){
                    //the \.fTaskID is needed because swiftUI needs an identifier for each task in the array. don't ask why!
                    ForEach(allTasksList, id: \.fTaskID){ task in
                        FakeTaskCard(fTask: task)
                    }
                }
                .padding(.vertical,5)
                .padding(.horizontal,12)
                
            }
            
            
            
            // text field overlay
            if showTextFieldOverlay == true{
                VStack{
                    //input field
                    TextField ("Task title:", text: $userTaskTitle )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal,12)
                    
                    HStack{
                        //create button
                        Button(action: addNewTask) {
                            Text("create task")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.indigo)
                                .foregroundStyle(.white)
                                .cornerRadius(10)
                        }
                        
                        
                        //cancel button
                        Button(action: {
                            showTextFieldOverlay = false // Hide the overlay if user cancels
                            userTaskTitle = "" // Optionally clear the title
                        }) {
                            Text("Cancel")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .foregroundStyle(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal,12)
                    
                }

                
            }
            
            
            
        }
        
        
        
        
    }
    
    //function to create new tasks
    func addNewTask(){
        let newTask  = FakeTask(fTaskName: "New Task \(allTasksList.count + 1)", fTaskID: UUID(), fTaskCompleted: false)
        allTasksList.append(newTask)
    }
}

#Preview {
    TaskBankPage()
}
