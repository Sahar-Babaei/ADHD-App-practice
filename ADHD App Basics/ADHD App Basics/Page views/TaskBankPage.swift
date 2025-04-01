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
                        viewModel.gridViewEnabled.toggle()
                    }) {
                        HStack(alignment: .center){
                            Text ("view: ")
                                .foregroundColor(Color("BodyCopy"))
                            Image (viewModel.gridViewEnabled ? "view-list" : "view-column")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("BodyCopy"))

                        }
                        .padding()
                        .background(Color(.yellow))

                    }
                    

                    
                   
                    Spacer()
                    
                    //sort button
                    Button (action: {
                        viewModel.reverseOrder.toggle()
                        sortTasks()
                    }) {
                        HStack(alignment: .center){
                            Text ("order: ")
                                .foregroundColor(Color("BodyCopy"))
                            Image (viewModel.reverseOrder ? "sort-up" : "sort-down")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("BodyCopy"))

                        }
                    }
                    .padding()
                    .background(Color(.yellow))
                    
                    
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
                
                HStack{
                   
                    HStack(alignment: .center, spacing: 6){
                        Image("filter-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("BodyCopy"))
                        
                        Text("filter")
                    }
                    .padding(.horizontal, 12)
                        .padding(.vertical, 9)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .cornerRadius(24)
                        .overlay(
                        RoundedRectangle(cornerRadius: 24)
                        .inset(by: 0.4)
                        .stroke(Color(red: 0.35, green: 0.35, blue: 0.35), lineWidth: 0.8)

                        )
                    
                    HStack(alignment: .center, spacing: 6){
                        Image("search-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("BodyCopy"))
                        
                        Text("search")
                    }
                    .padding(.horizontal, 12)
                        .padding(.vertical, 9)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .cornerRadius(24)
                        .overlay(
                        RoundedRectangle(cornerRadius: 24)
                        .inset(by: 0.4)
                        .stroke(Color(red: 0.35, green: 0.35, blue: 0.35), lineWidth: 0.8)

                        )
                    
                    HStack(alignment: .center, spacing: 6){
                        Image("sort-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("BodyCopy"))
                        
                        Text("group")
                    }
                    .padding(.horizontal, 12)
                        .padding(.vertical, 9)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .cornerRadius(24)
                        .overlay(
                        RoundedRectangle(cornerRadius: 24)
                        .inset(by: 0.4)
                        .stroke(Color(red: 0.35, green: 0.35, blue: 0.35), lineWidth: 0.8)

                        )
                    

                }
                .padding(.horizontal, 12)

                
                ScrollView {
                    // LazyVGrid adjusts the number of columns dynamically
                    LazyVGrid(columns: getColumnStyle(viewModel.gridViewEnabled)) {
                        ForEach(viewModel.allTasksList, id: \.ID) { task in
                            TaskCard(fTask: task, onDelete: {
                                viewModel.allTasksList.removeAll { $0.ID == task.ID }
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
                        TaskCreation(viewModel: TaskCreationViewModel(), storageViewModel: viewModel, showExpanded: false, onComplete: {
                            viewModel.showTextFieldOverlay = false
                            
                        })

                        //input field
//                        TextField ("Task title:", text: $viewModel.userTaskTitle)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding(.horizontal,12)
//                        
//                        HStack{
//                            //create button
//                            Button(action: addNewTask) {
//                                Text("create task")
//                                    .padding()
//                                    .frame(maxWidth: .infinity)
//                                    .background(Color.green)
//                                    .foregroundStyle(.white)
//                                    .cornerRadius(10)
//                            }
//                            
//                            
//                            //cancel button
//                            Button(action: {
//                                viewModel.showTextFieldOverlay = false // Hide the overlay if user cancels
//                                viewModel.clearTitle()// Optionally clear the title
//                            }) {
//                                Text("Cancel")
//                                    .padding()
//                                    .frame(maxWidth: .infinity)
//                                    .background(Color.red)
//                                    .foregroundStyle(.white)
//                                    .cornerRadius(10)
//                            }
//                        }
//                        .padding(.horizontal,12)
                        
                    }
//                    .padding()
                    //.background(Color.black.opacity(0.5)) // Dim the background
//                    .cornerRadius(20)


                    
                }
                
                
                
            }
        }        
    }
    
    func getColumnStyle(_ isGridMode: Bool) -> [GridItem] {
        return isGridMode ? [GridItem(.flexible())] : [GridItem(.flexible()), GridItem(.flexible())]
    }
    
    //function to create new tasks
    func addNewTask(){
//        viewModel.addTask()
        
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
