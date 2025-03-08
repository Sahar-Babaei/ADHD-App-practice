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
            
            //Add task button Button
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
            
            
            //Text field for task input
            //            TextField ("Task title:", text: $userTaskTitle )
            //                .padding()
            //                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            
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
            
            
            if showTextFieldOverlay == true{
                VStack{
                    TextField ("Task title:", text: $userTaskTitle )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal,12)
                    
                    Button(action: addNewTask) {
                        Text("Add Task")
                            .padding()
                            .background(Color.green)
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                    }
                }
                .background(Color.white.opacity(0.5))
                
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
