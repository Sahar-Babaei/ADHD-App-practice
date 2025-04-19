//
//  TaskBankPage.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-03-03.
//

import SwiftUI
import Foundation


struct TaskBankOverlay: View {
    
    //@State means SwiftUI will automatically update the screen when the list changes
    
    @ObservedObject var viewModel : TaskBankViewModel
//    init(viewModel: TaskBankViewModel){
//        self.viewModel = viewModel
//      //  _viewModel =  ObservedObject(wrappedValue: potato)
//        viewModel.loadAllTasks()
//    }
    
    
    
    //selection mode
    var isSelectionMode: Bool = true
    var onSelectTasks: (([Task]) -> Void)? = nil
    var onEdit: ((Task) -> Void)? = nil
    var onComplete : (Bool) -> Void = { _ in }
    var onError : () -> Void = {}
    var priority: Priority
    
    @FocusState private var searchIsFocused: Bool
    
    //filtering, sorting and searching variables
    @State private var searchText: String = ""
    @State private var selectedFilter: String = "All"  //how to set selected filter
    @State private var presentingSheet: Bool = false
//    @State private var
    
    //selection mode adding tasks to today's plan
    @State private var counter = 0
    
    @State private var bankIsEmpty: Bool = false
    
//    private var selectCardGesture: some Gesture {
//        isSelectionMode ? (TapGesture().onEnded { counter += 1 }) : nil
//    }
//    var selectedTaskList: [Task]
    
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
    
    @State var searchActive: Bool = false
    @State var filterActive: Bool = false
    var filteredItems: [Task] {
        var items = viewModel.allTasksList.filter { $0.status == .notStarted}
        
//        searchActive = !searchText.isEmpty
        
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
        print(filteredTasks.count)
        print(filteredTasks)
        print("selected filter:" + selectedFilter)
     
        return filteredTasks
        
    }
    
    
    
    //important: can't create functions in body. body is a special property that returns views
    var body: some View {
        //Navigation path
        NavigationStack {
            ZStack {
                VStack(alignment: .leading){
                    


               //buttons
                   // top part
                    VStack{
                        HStack(){
                            
                            //cancel button
                            Button(action: {
                                self.onComplete(false)
                                viewModel.selectedTaskList.removeAll()
                            }) {
                                Text("Cancel")
                                    .padding(.top)
                                    .padding(.bottom)
                                    .frame(height: 32)
                                    .foregroundStyle(Color("BodyCopy"))
                                    .underline()
                            }
                            
                            Spacer()
                            
                            //add Task button
                            Button(action: {
                                viewModel.selectedTaskList.forEach{ task in
                                    let tasksAlreadyInTodaysPriority = viewModel.getTodaysTaskForPriority(priority: priority)
                                    if (tasksAlreadyInTodaysPriority.count < 3)
                                    {
                                        task.status = .plannedForToday
                                        task.taskAssignment = TaskAssignment(date: Date(), priority: priority)
                                        
                                        viewModel.updateTask(task)
                                        self.onComplete(true)
                                    } else {
                                        self.onError()
                                    }
                                    
                                    
                                }
                                //                                viewModel.selectedTaskList.removeAll()
                                print(viewModel.selectedTaskList)
                                viewModel.selectedTaskList.removeAll()
                                
                            }) {
                                Text("Done")
                                    .padding()
                                    .frame(height: 32)
                                    .background(Color("SectionButtonBackground"))
                                    .foregroundStyle(Color("BodyCopyReverse"))
                                    .cornerRadius(10)
                            }
                        }
//                        .padding(.horizontal, 12)
//                        .padding(.bottom, 10)
//                        .padding(.vertical, 10)
//                        .padding(.top, 15)
                        .padding(.bottom,0)
                        .padding(.top,15)
                        //.padding(.bottom,0)
                        .padding(.horizontal)
                        //.background(.red)
                        
                        
                        
                        HStack(){
                            //instructions
                            Text("Select Tasks to add to the \(priority.name.lowercased().capitalized) sections or tap the '+' button to create a new task")
                                .font(Font.custom("Helvetica", size: 15))
                                .fontWeight(.regular)
                                .foregroundColor(Color("BodyCopy"))
                            //.background(.orange)
                            
                        }
                        .frame(maxWidth:.infinity)
//                        .padding(.horizontal)
//                        .padding(.bottom,6)
//                        .padding(.top,22)
                       // .padding()
//                        .padding(.bottom,18)
//                        .padding(.top,4)
                        .padding(.horizontal,2)
                        .padding(.top,10)
                        .padding(.bottom,15)
                        //.background(Color("TagNoColor"))
                        

                    }
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color("MainForeground")),
                        alignment: .bottom
                    )
                    .padding(.top,6)
                    .padding(.bottom,10)
                    
//                    .padding(.bottom, 12)
//                    .padding(.vertical, 10)
                    //.background(.red)
                    
//                    
//                    HStack(){
//                        //instructions
//                        Text("Select up to 3 Tasks to add to the \(priority.name.lowercased().capitalized) sections")
//                            .font(Font.custom("Helvetica", size: 15))
//                            .fontWeight(.regular)
//                            .foregroundColor(Color("BodyCopy"))
//                            //.background(.orange)
//                        
//                                            
// 
//                    }
//                    .frame(maxWidth:.infinity,maxHeight:1)
//                    .padding(.top,0)
//                    .padding(.bottom, 12)
//                    .padding(.vertical, 10)
//                    //.background(.red)

                   
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
                                .focused($searchIsFocused)
                                .onChange(of: searchText) { oldValue, newValue in
                                    searchActive = !newValue.isEmpty
                                }

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

                        Button(action: {
                            viewModel.gridViewEnabled.toggle()
                        }) {
                            HStack(alignment: .center){

                                Image (viewModel.gridViewEnabled ? "view-column" : "view-list")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(Color("FiltersBodycopy"))
                            }
                            .padding(.horizontal,5)

                        }

                        Button (action: {
                            viewModel.reverseOrder.toggle()
                            sortTasks()
                        }) {
                            HStack(alignment: .center){
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

                    if !selectedFilter.isEmpty && selectedFilter != "All" {
                        Text("Filtered by: " + selectedFilter)
                            .font(Font.custom("Helvetica", size: 16))
                            .fontWeight(.regular)
                            .italic()
                            .foregroundColor(Color("BodyCopy"))
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                    }
                    
//                    if isSelectionMode {    //show instructions when selecting tasks
//                        Text("Select your tasks from the bank:")
//                            .font(Font.custom("Helvetica", size: 16))
//                            .fontWeight(.regular)
//                            .foregroundColor(Color("BodyCopy"))
//                            .padding(.horizontal)
//                            .padding(.vertical, 10)
//                    }
                    
                    ScrollView {
                        LazyVGrid(columns: getColumnStyle(viewModel.gridViewEnabled)) {
                            ForEach(filteredItems, id: \.ID) { task in
//                                if(task.status == .notStarted) {
                                    TaskCard(fTask: task,chosenHeight: (viewModel.gridViewEnabled ? 112 : 155), chosenSpacing:(viewModel.gridViewEnabled ? 6 : 25), onDelete: {
                                        viewModel.allTasksList.removeAll { $0.ID == task.ID }
                                    },onEdit: {
                                        print("scooby doo")
                                        onEdit?(task)
                                    },onSelect: { selected in
                                        searchIsFocused = false
                                        if selected == true {
                                            viewModel.selectedTaskList.append(task)
                                            onEdit?(task)
                                        }
                                        else {
                                            viewModel.selectedTaskList.removeAll { $0.ID == task.ID }
                                        }
                                        
//                                        print(viewModel.selectedTasklist)
                                    }, selectionModeEnabled : isSelectionMode
                                
                                    )
//                                        .onTapGesture {
//                                            print("this thing works: " + task.name )
////                                            selectedTaskList.append(task)
//                                        }

//                                }
                                                           
                            }
                        }

                        .padding(.top, 5)
                        .padding(.bottom,85)
                        .padding(.horizontal, 12)
                    }


                    
                    
                    
//                    if viewModel.showTextFieldOverlay == true{
//                        
//                        VStack{
//                            TaskCreation(viewModel: TaskCreationViewModel(), storageViewModel: viewModel, showExpanded: false, onComplete: {_ in
//                                viewModel.showTextFieldOverlay = false
//                            })
//                        }
//                    }
                    
                    
                    
                }
                
                .background(Color("MainBackground"))
                
                .onTapGesture {
                    searchIsFocused = false
                    withAnimation {
                        presentingSheet=false
                    }
                    
                }
                .onChange(of: selectedFilter) {
                    filterActive = selectedFilter != "All"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
                        withAnimation(.easeInOut(duration: 0.35)){
                            presentingSheet = false
                        }
                    }
                }
                
                
                //ALL THE DIFFERENT EMPTY STATES FOR FILTER && SEARCH BAR
                if filteredItems.isEmpty{
                    ZStack{
                        Image("DoDudePointDown")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding()
                        
                        HStack(){
                            if searchActive && filterActive {
                                Text("looks like nothing is working")
                                    .font(Font.custom("Instrument Sans", size: 16))
                                    .foregroundColor(Color("BodyCopy"))
                                    .padding()
                            }
                            else if searchActive {
                                Text("No results for search")
                                    .font(Font.custom("Instrument Sans", size: 16))
                                    .foregroundColor(Color("BodyCopy"))
                                    .padding()
                            }
                            else if filterActive {
                                Text("wrong filter woop woop")
                                    .font(Font.custom("Instrument Sans", size: 16))
                                    .foregroundColor(Color("BodyCopy"))
                                    .padding()
                            }
                            else {
                                Text("It looks like there aren't any tasks with the \"Not Started\" status. \nAdd a task below!")
                                    .font(Font.custom("Instrument Sans", size: 16))
                                    .foregroundColor(Color("BodyCopy"))
                                    .padding()
                            }
                            
                        }
                        .frame(maxHeight: 105)
                        .frame(maxWidth: 280)
                        .background(Color("BodyCopyReverse"))
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.15), radius: 2, x: 0, y: 2)
                        .overlay(
                        RoundedRectangle(cornerRadius: 15)
                        .inset(by: 0.5)
                        .stroke(Color("BodyCopy"), lineWidth: 1)

                        )
                        .padding(.top, 220)
                            
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

                    MultiplePickerView(selectedSensor: $selectedFilter)
                        .frame(width: 310, height: 580)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 10)
                        .padding(.bottom, 60)
                }
            }

            .clipShape(RoundedCorners(radius: 35, corners: [.topLeft, .topRight]))
            
            .onAppear {
                viewModel.loadAllTasks()
                //this makes all tasks appears when this page is loaded.
            }
            
            
            
            }
        
            
    }
         
    
    func getColumnStyle(_ isGridMode: Bool) -> [GridItem] {
        return isGridMode ? [GridItem(.flexible())] : [GridItem(.flexible()), GridItem(.flexible())]
    }
    

    
    func sortTasks(){
        viewModel.sortTasks()
    }
}

#Preview {
    TaskBankOverlay(viewModel: TaskBankViewModel(),isSelectionMode: true, priority: .mustDo)
}
