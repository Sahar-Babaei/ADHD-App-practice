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
    
    
    
    //important: can't create functions in body. body is a special property that returns views
    var body: some View {
        //Navigation path
        NavigationStack {
            ZStack {
                VStack(alignment: .leading){

               
                        HStack(){
                            
                            //cancel button
                            Button(action: { self.onComplete(false)}) {
                                Text("Cancel")
                                    .padding(.top)
                                    .padding(.bottom)
                                    .frame(height: 32)
                                    .foregroundStyle(Color("GreyStatusBody"))
                                    .underline()
                            }
                            
                            
                            Spacer()
                            
                            //add Task button
                            Button(action: {}) {
                                Text("Done")
                                    .padding()
                                    .frame(height: 32)
                                    .background(Color.black)
                                    .foregroundStyle(.white)
                                    .cornerRadius(10)
                            }
                            
                            
                        }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .padding(.top, 15)
                    
                    HStack(){
                        //instructions
                        Text("Select 3 Tasks to add to the ????? sections")
                            .font(Font.custom("Helvetica", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Color("BodyCopy"))
                        
                                            
 
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)

                   
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
                                TaskCard(fTask: task,chosenHeight: (viewModel.gridViewEnabled ? 112 : 157), chosenSpacing:(viewModel.gridViewEnabled ? 6 : 25), onDelete: {
                                    viewModel.allTasksList.removeAll { $0.ID == task.ID }
                                },onEdit: {
                                    print("scooby doo")
                                    onEdit?(task)
                                },onSelect: { selected in
                                    
                                    onEdit?(task)
                                }, selectionModeEnabled : isSelectionMode
                            
                                )
                                    .onTapGesture {
                                        print("this thing works: " + task.name )
                                    }
                           
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

                    MultiplePickerView(selectedSensor: $selectedFilter)
                        .frame(width: 350, height: 730)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 10)
                }

            }
//            .frame(height:600)
            .clipShape(RoundedCorners(radius: 30, corners: [.topLeft, .topRight]))
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
    TaskBankOverlay(viewModel: TaskBankViewModel())
}
