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
    
    @ObservedObject var viewModel : TaskBankViewModel
//    init(viewModel: TaskBankViewModel){
//        self.viewModel = viewModel
//      //  _viewModel =  ObservedObject(wrappedValue: potato)
//        viewModel.loadAllTasks()
//    }
    
    //filtering, sorting and searching variables
    @State private var searchText: String = ""
    
    //let all items on taskbank = viewModel.allTasksList
    
    var filteredItems: [Task] {
        var items = viewModel.allTasksList
        
        if !searchText.isEmpty {
            items = items.filter {$0.name.localizedCaseInsensitiveContains(searchText) }
        }
        return items
    }
    
    //important: can't create functions in body. body is a special property that returns views
    var body: some View {
        //Navigation path
        NavigationStack {
            VStack{
                TextField("Search...", text: $searchText)
                    .padding(.horizontal)
                
                HStack(){
                    //toggle button
                    Text("Task Bank")
                        .font(Font.custom("Helvetica", size: 28))
                        .fontWeight(.bold)
                        //.foregroundColor(Color("Bodycopy"))
                        
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.gridViewEnabled.toggle()
                    }) {
                        HStack(alignment: .center){
//                            Text ("view: ")
//                                .foregroundColor(Color("FiltersBodycopy"))
                            Image (viewModel.gridViewEnabled ? "view-column" : "view-list")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("FiltersBodycopy"))
                        }
                        .padding(.horizontal,5)
//                        .background(Color(.yellow))

                    }
                    
                  //  Spacer()

                        

                    
                    //sort button
                    Button (action: {
                        viewModel.reverseOrder.toggle()
                        sortTasks()
                    }) {
                        HStack(alignment: .center){
//                            Text ("order: ")
//                                .foregroundColor(Color("FiltersBodycopy"))
                            Image (viewModel.reverseOrder ? "sort-down" : "sort-up")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("FiltersBodycopy"))
                        }
                    }
                    .padding(.horizontal,5)
                        
                }
                .padding(.horizontal, 12)
                .padding(.bottom,10)
                
                HStack{
                   
                    HStack(alignment: .center, spacing: 6){
                        Image("filter-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("FiltersBodycopy"))
                        
                        Text("filter")
                            .foregroundColor(Color("FiltersBodycopy"))
                    }
                    .padding(.horizontal, 12)
                        .padding(.vertical, 9)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .cornerRadius(24)
                        .overlay(
                        RoundedRectangle(cornerRadius: 24)
                        .inset(by: 0.4)
                        .stroke(Color("FiltersBodycopy"))

                        )
                    
                    HStack(alignment: .center, spacing: 6){
                        Image("search-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("FiltersBodycopy"))
                        
                        Text("search")
                            .foregroundColor(Color("FiltersBodycopy"))
                    }
                    .padding(.horizontal, 12)
                        .padding(.vertical, 9)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .cornerRadius(24)
                        .overlay(
                        RoundedRectangle(cornerRadius: 24)
                        .inset(by: 0.4)
                        .stroke(Color("FiltersBodycopy"))

                        )
                    
                    HStack(alignment: .center, spacing: 6){
                        Image("sort-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("FiltersBodycopy"))
                        
                        Text("Sort")
                            .foregroundColor(Color("FiltersBodycopy"))
                    }
                    .padding(.horizontal, 12)
                        .padding(.vertical, 9)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .cornerRadius(24)
                        .overlay(
                        RoundedRectangle(cornerRadius: 24)
                        .inset(by: 0.4)
                        .stroke(Color("FiltersBodycopy"))

                        )
                    

                }
                .padding(.horizontal, 12)

                
                ScrollView {
                    // LazyVGrid adjusts the number of columns dynamically
                    LazyVGrid(columns: getColumnStyle(viewModel.gridViewEnabled)) {
                        ForEach(filteredItems, id: \.ID) { task in
                            TaskCard(fTask: task, onDelete: {
                                viewModel.allTasksList.removeAll { $0.ID == task.ID }
                            })
                        }
                    }
//                    .padding(.vertical, 10)
                    .padding(.top, 5)
                    .padding(.bottom,85)
                    .padding(.horizontal, 12)
                   // .background(.yellow)
                }
              //  .padding(.bottom,75)

                
                
                
                // text field overlay
                if viewModel.showTextFieldOverlay == true{
                    
//                    TaskCard(task: Task(taskName: "helloooo"))
                //MARK: can have viewModel create task + have array in viewModel as well
            
                    
                    VStack{
                        TaskCreation(viewModel: TaskCreationViewModel(), storageViewModel: viewModel, showExpanded: false, onComplete: {_ in 
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
            .background(Color("MainBackground"))
        }
        .onAppear {
            viewModel.loadAllTasks()
            //this makes all tasks appears when this page is loaded.
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
    TaskBankPage(viewModel: TaskBankViewModel())
}
