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
//    @State var allTasksList : [TaskCard] = []
    @State var userTaskTitle : String = ""
    @State var showTextFieldOverlay : Bool = false
    
    @State var reverseOrder : Bool = false
    
    @State private var columns: [GridItem] = [GridItem(.flexible())] // Default is 1 column
    
    
    
    //important: can't create functions in body. body is a special property that returns views
    var body: some View {
        
        //Navigation path
        NavigationStack {
            VStack{
                
                
                HStack{
                    
                    
                    //toggle button
                    Button(action: {
                        columns = columns.count == 1 ? [GridItem(.flexible()), GridItem(.flexible())] : [GridItem(.flexible())]
                    }) {
                        Text(columns.count == 1 ? "Switch to 2 Columns" : "Switch to 1 Column")
                            .padding()
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                    }
                    
                    //sort button
                    Button(action: {reverseOrder.toggle()
                        sortTasks(reversed: reverseOrder)


                    }) {
                        Text(reverseOrder ? "Sort: Reverse Order" : "Sort: Regular Order")
                            .padding()
                    }
                    
                    
                    Spacer()
                    
                    //Add task Button
                    Button(action: {showTextFieldOverlay=true}) {
                        Text("Add New Task +")
                            .padding()
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                    }
            
            //MARK: adding a navigation path to the task creation page
//                    NavigationLink("Add New Task +", destination: TaskCard(task: Task(taskName: "")))
//                        .buttonStyle(.borderedProminent)
//                        //.padding()
                    
                    

                }
                .padding(.horizontal, 12)
                
                
                
                
                
                
    //            //for loop to show Task cards
    //            ScrollView{
    //
    //                //LazyVStack only loads what's on the screen.
    //                LazyVStack(){
    //
    //                    //the \.fTaskID is needed because swiftUI needs an identifier for each task in the array. don't ask why!
    //
    //                    ForEach(allTasksList, id: \.fTaskID) { task in
    //                        FakeTaskCard(fTask: task, onDelete: {
    //                            allTasksList.removeAll { $0.fTaskID == task.fTaskID }
    //                        })
    //                    }
    //                }
    //
    //                //ForEach(if(reverseOrder)allTasksList.reversed() else {allTasksLists})
    //                .padding(.vertical,5)
    //                .padding(.horizontal,12)
    //
    //            }
                
                ScrollView {
                    // LazyVGrid adjusts the number of columns dynamically
                    LazyVGrid(columns: columns) {
                        ForEach(allTasksList, id: \.fTaskID) { task in
                            FakeTaskCard(fTask: task, onDelete: {
                                allTasksList.removeAll { $0.fTaskID == task.fTaskID }
                            })
                        }
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 12)
                }
                
//                ScrollView {
//                    // LazyVGrid adjusts the number of columns dynamically
//                    LazyVGrid(columns: columns) {
//                        ForEach(allTasksList, id: \.task.taskId) { task in
//                            TaskCard(fTask: task, onDelete: {
//                                allTasksList.removeAll { $0.fTaskID == task.fTaskID }
//                            })
//                        }
//                    }
//                    .padding(.vertical, 5)
//                    .padding(.horizontal, 12)
//                }
                
                
                
                // text field overlay
                if showTextFieldOverlay == true{
                    
                    TaskCard(task: Task(taskName: "hello"))
                    
//                    VStack{
//                        //input field
//                        TextField ("Task title:", text: $userTaskTitle )
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
//                                showTextFieldOverlay = false // Hide the overlay if user cancels
//                                userTaskTitle = "" // Optionally clear the title
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
//                        
//                    }
//                    .padding()
//                    .background(Color.black.opacity(0.5)) // Dim the background
//                    .cornerRadius(20)


                    
                }
                
                
                
            }
        }
        
        
        
        
        
        
    }
    
    //function to create new tasks
    func addNewTask(){
        
        // this only adds a new task if title is not empty
        guard !userTaskTitle.isEmpty else { return }
        
        let newTask  = FakeTask(fTaskName: userTaskTitle, fTaskID: UUID(), fTaskCompleted: false)
    
        

        allTasksList.append(newTask)
        sortTasks(reversed: reverseOrder)
        // this adds the task at the top rather than at the end:
//        allTasksList.insert(newTask, at: 0)
        
        // Hide the overlay and reset the task title
        showTextFieldOverlay = false
        userTaskTitle = ""
    }
    
    func sortTasks(reversed: Bool ){
        allTasksList = allTasksList.sorted { taskA, taskB in
            if reversed {
                taskA.fTaskCreationDate > taskB.fTaskCreationDate
            }
            else{
                taskA.fTaskCreationDate < taskB.fTaskCreationDate
            }
        }
    }
}

#Preview {
    TaskBankPage()
}
