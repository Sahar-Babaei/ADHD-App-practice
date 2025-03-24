//
//  TaskBankPage.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-03-03.
//

import SwiftUI
import Foundation


struct TaskBankPage: View {
    
    //@State means SwiftUI will automatically update the screen when the list changes
    
    @StateObject var viewModel : TaskBankViewModel
    init(potato: TaskBankViewModel){
        _viewModel = StateObject(wrappedValue: potato)
        potato.loadAllTasks()
    }
    
    //important: can't create functions in body. body is a special property that returns views
    var body: some View {
        //Navigation path
        NavigationStack {
            VStack{
                HStack{
                    //toggle button
                    Button(action: {
                        addNewTask()
                        viewModel.gridViewEnabled.toggle()
                    }) {
                        Text(viewModel.gridViewEnabled ? "Switch to 2 Columns" : "Switch to 1 Column")
                            .padding()
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                    }
                    
                    //sort button
                    Button(action: {
                        viewModel.reverseOrder.toggle()
                        sortTasks()
                    }) {
                        Text(viewModel.reverseOrder ? "Sort: Reverse Order" : "Sort: Regular Order")
                            .padding()
                    }
                    
                    
                    Spacer()
                    
                    //Add task Button
                    Button(action: {viewModel.showTextFieldOverlay=true}) {
                        Text("Add New Task +")
                            .padding()
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                    }
                                

                }
                .padding(.horizontal, 12)
                
                

                
                ScrollView {
                    // LazyVGrid adjusts the number of columns dynamically
                    LazyVGrid(columns: getColumnStyle(viewModel.gridViewEnabled)) {
                        ForEach(viewModel.allTasksList, id: \.fTaskID) { task in
                            FakeTaskCard(fTask: task, onDelete: {
                                viewModel.allTasksList.removeAll { $0.fTaskID == task.fTaskID }
                            })
                        }
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 12)
                }

                
                
                
                // text field overlay
                if viewModel.showTextFieldOverlay == true{
                    
//                    TaskCard(task: Task(taskName: "hello"))
                //MARK: can have viewModel create task + have array in viewModel as well
            
                    VStack{
                        //input field
                        TextField ("Task title:", text: $viewModel.userTaskTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal,12)
                        
                        HStack{
                            //create button
                            Button(action: addNewTask) {
                                Text("create task")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.green)
                                    .foregroundStyle(.white)
                                    .cornerRadius(10)
                            }
                            
                            
                            //cancel button
                            Button(action: {
                                viewModel.showTextFieldOverlay = false // Hide the overlay if user cancels
                                viewModel.clearTitle()// Optionally clear the title
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
                    .padding()
                    .background(Color.black.opacity(0.5)) // Dim the background
                    .cornerRadius(20)


                    
                }
                
                
                
            }
        }        
    }
    
    func getColumnStyle(_ isGridMode: Bool) -> [GridItem] {
        return isGridMode ? [GridItem(.flexible())] : [GridItem(.flexible()), GridItem(.flexible())]
    }
    
    //function to create new tasks
    func addNewTask(){
        viewModel.addTask()
        
        // Hide the overlay and reset the task title
        viewModel.showTextFieldOverlay = false
    }
    
    func sortTasks(){
        viewModel.sortTasks()
    }
}

#Preview {
    TaskBankPage(potato: TaskBankViewModel())
}
