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
    
    //selection mode
    var isSelectionMode: Bool = false
    var onSelectTasks: (([Task]) -> Void)? = nil
    
    //filtering, sorting and searching variables
    @State private var searchText: String = ""
    @State private var selectedFilter: String = "All"  //how to set selected filter
    @State private var presentingSheet: Bool = false
//    @State private var
    
    //selection mode adding tasks to today's plan
    @State private var counter = 0
    
//    private var selectCardGesture: some Gesture {
//        isSelectionMode ? (TapGesture().onEnded { counter += 1 }) : nil
//    }
    
    //categories
    var filters: [String] {
        var seen: Set<String> = [] // keeps track of unique values
        var uniqueFilters: [String] = []
        
        for item in viewModel.allTasksList {
            if !seen.contains(item.status.name) {
                seen.insert(item.status.name)
                uniqueFilters.append(item.status.name)
            }
            if !seen.contains(item.tag.name) {
                seen.insert(item.tag.name)
                uniqueFilters.append(item.tag.name)
            }
            
        }
        return ["All"] + uniqueFilters
    }
    
    var filteredItems: [Task] {
        var items = viewModel.allTasksList
        
        let searchItems = if !searchText.isEmpty  {
            items.filter {$0.name.localizedCaseInsensitiveContains(searchText) }
        } else {
            items
        }
        
        let filteredTasks = if !selectedFilter.isEmpty {
            //how to i get to the tasks inside the alltaskslist
            searchItems.filter {
                $0.status.name == selectedFilter || $0.tag.name == selectedFilter || selectedFilter == "All"
                            }
        } else {
            searchItems
        }
        print(filteredTasks)
        print("selected filter:" + selectedFilter)
        return filteredTasks
        
    }
    
    //old filtering code with the 'all; filter included
    //categories
//    var filters: [String] {
//        let categoryStatus = viewModel.allTasksList.map {$0.status.name}
//        let categoryTag = viewModel.allTasksList.map {$0.tag.name}
//
//        let uniqueFilters = Set(categoryStatus + categoryTag)
//        return ["All"] + uniqueFilters
//    }
//    
//    var filteredItems: [Task] {
//        var items = viewModel.allTasksList
//        
//        let searchItems = if !searchText.isEmpty  {
//            items.filter {$0.name.localizedCaseInsensitiveContains(searchText) }
//        } else {
//            items
//        }
//        
//        let filteredTasks = if !selectedFilter.isEmpty {
//            //how to i get to the tasks inside the alltaskslist
//            searchItems.filter {
//                $0.status.name == selectedFilter || $0.tag.name == selectedFilter || selectedFilter == ["All"]
//            }
//        } else {
//            items
//        }
//        return filteredTasks
//    }
    
    //important: can't create functions in body. body is a special property that returns views
    var body: some View {
        //Navigation path
        NavigationStack {
            ZStack {
                VStack(alignment: .leading){

                    Spacer()
                        .frame(height: 25)
                    
                    HStack(){
                        //page's title
                        Text("Task Bank")
                            .font(Font.custom("Helvetica", size: 26))
                            .fontWeight(.bold)
                            .foregroundColor(Color("BodyCopy"))
                        
                                            
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
                   
                    //filter button
                    HStack{
                       //filters are a nice to have + sort is nice to have
                        Button (action: {
                            presentingSheet = true
                        }) {
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
                        }
                        
                        
                        HStack(alignment: .center, spacing: 6){
                            Image("search-icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("FiltersBodycopy"))
                            
                            TextField("Search...", text: $searchText)
                                .padding(.horizontal)
                                .foregroundColor(Color("FiltersBodycopy"))

                            
    //                        Text("search")
    //                            .foregroundColor(Color("FiltersBodycopy"))
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
                        
                       
                        
    //                    HStack(alignment: .center, spacing: 6){
    //                        Image("sort-icon")
    //                            .resizable()
    //                            .scaledToFit()
    //                            .frame(width: 24, height: 24)
    //                            .foregroundColor(Color("FiltersBodycopy"))
    //
    //                        Text("Sort")
    //                            .foregroundColor(Color("FiltersBodycopy"))
    //                    }
    //                    .padding(.horizontal, 12)
    //                        .padding(.vertical, 9)
    //                        .frame(maxWidth: .infinity, alignment: .center)
    //                        .cornerRadius(24)
    //                        .overlay(
    //                        RoundedRectangle(cornerRadius: 24)
    //                        .inset(by: 0.4)
    //                        .stroke(Color("FiltersBodycopy"))
    //
    //                        )
                        

                    }
                    .padding(.horizontal, 12)
                    
                    //TODO: fix spacing between filter bar and tasks
                    //show filtering results for everything but all
                    if !selectedFilter.isEmpty && selectedFilter != "All" {
                        Text("Filtered by: " + selectedFilter)
                            .font(Font.custom("Helvetica", size: 16))
                            .fontWeight(.regular)
                            .italic()
                            .foregroundColor(Color("BodyCopy"))
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                    }
                    
                    if isSelectionMode {    //show instructions when selecting tasks
                        Text("Select your tasks from the bank:")
                            .font(Font.custom("Helvetica", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Color("BodyCopy"))
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                    }
                    
                    ScrollView {
                        // LazyVGrid adjusts the number of columns dynamically
                        LazyVGrid(columns: getColumnStyle(viewModel.gridViewEnabled)) {
                            ForEach(filteredItems, id: \.ID) { task in
                                TaskCard(fTask: task,chosenHeight: (viewModel.gridViewEnabled ? 112 : 157), chosenSpacing:(viewModel.gridViewEnabled ? 6 : 25), onDelete: {
                                    viewModel.allTasksList.removeAll { $0.ID == task.ID }
                                }, cardSelected: (isSelectionMode ? true : false)
                                
                                )
//                                if isSelectionMode {
                                    .onTapGesture {
                                        print("this thing works: " + task.name )
                                    }
//                                }
//                                .onTapGesture {
//                                    
//                                }
//                                .gesture(selectCardGesture)
//                                Toggle(isOn: $isSelectionMode)
                           
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
                .onTapGesture {
                    withAnimation {
                        presentingSheet=false
                    }
                    
                }
                .onChange(of: selectedFilter) {
    
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
                            withAnimation(.easeInOut(duration: 0.35)){
                                presentingSheet = false
                            }
                        }
    
                
                }
                
                if presentingSheet{

                        Color.black.opacity(0.4) // Dimming effect
                            .ignoresSafeArea()
                        .transition(.opacity)
                        .onTapGesture {
                            
                            withAnimation {
                                presentingSheet=false
                            }
                        }
                    
                    //here is where you can apply filter if you want it to be applied after the popup is closed
                    
                    //            //TODO: would be nice to have this dark background
                    ////                    Color.black.opacity(0.3)
                    ////                        .edgesIgnoringSafeArea(.all)
                    ////                        .onTapGesture {
                    ////                            withAnimation {
                    ////                                presentingSheet = false
                    //                            }
                    //                    Rectangle()
                    //                        .frame(width: 100, height: 100)
                    //                        .background(Color(.blue))
                    MultiplePickerView(selectedSensor: $selectedFilter)
                        .frame(width: 350, height: 730)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 10)
                }
//                }.onChange(of: selectedFilter) {
//                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
//                        withAnimation(.easeInOut(duration: 0.35)){
//                            presentingSheet = false
//                        }
//                    }
//                    
//                }
            }
            .onAppear {
                viewModel.loadAllTasks()
                //this makes all tasks appears when this page is loaded.
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
    TaskBankPage(viewModel: TaskBankViewModel())
}
