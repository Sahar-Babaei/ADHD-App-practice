//
//  TaskCreation.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-03-24.
//

import SwiftUI

struct TaskEdition: View {
    
    //keep track of overlay expansion
    @State private var selectedStatus: Status = .notStarted // New state for status
    @State private var selectedTag: Tag = .none
    @State private var selectedPriority: Priority = .niceToDo
    @State private var showExpanded: Bool = true
    @State private var hasUserSelectedPriority = false
    
    @State private var text: String = ""
    @StateObject var viewModel = TaskCreationViewModel()
    @StateObject var storageViewModel = TaskBankViewModel()
    var onComplete : (Bool) -> Void = { _ in }
    var onError : () -> Void = { }
    var onEmptyNameError : () -> Void = { }
    
    init(viewModel: TaskCreationViewModel, storageViewModel: TaskBankViewModel, showExpanded: Bool , onComplete: @escaping (Bool) -> Void, onError: @escaping () -> Void,onEmptyNameError: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _storageViewModel = StateObject(wrappedValue: storageViewModel)
        self.showExpanded = showExpanded
        self.onComplete = onComplete //not invoking, just saving.
        self.onError = onError
        self.onEmptyNameError = onEmptyNameError
        //        self.tagDropDown = TagDropDownMenu()
        //self.statusDropDown = StatusDropDownMenu()
        //  self.selectedPriority = selectedPriority
    }
    
    var body: some View {
        VStack{
            ZStack{
                //transparency background
                
                
                //Quick View task creation view
                VStack(alignment: .leading) {
                    
                    //heading + arrow button
                    HStack(alignment:.center){
                        //heading
                        Text("Task title")
                            .font(Font.custom("Instrument Sans", size: 14)) // Set the custom font
                            .fontWeight(.regular) // Apply weight separately
                        
                        Spacer()
                        
                        // arrow
                        Button(action: {
                            showExpanded.toggle()
                            print(showExpanded)
                        }) {
                            //only rotate chevron icon downward when showExpanded is true
                            Image("chevron-double-up")
                                .foregroundColor(Color("BodyCopy"))
                                .scaleEffect(y: showExpanded ? -1 : 1)
                        }
                    }
                    
                    //task name text field
                    //TODO: mentor - need to find way to allow binding to name
                    //                TextField("Enter your task here", text: $viewModel.fTask.name)
                    //                    .padding(.vertical, 12) // Adds internal padding
                    //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("FieldBackground"))
                            .frame(height: 60) // Adjust height here
                        TextField("Enter your task here", text: $viewModel.fTask.name)
                            .onChange(of: viewModel.fTask.name, perform: {newValue in
                                if (newValue.count > 73)
                                {
                                    viewModel.fTask.name = String(newValue.prefix(upTo:  newValue.index(newValue.startIndex, offsetBy: 73)))
                                    //                                setErrorFlag
                                } else {
                                    //                                removeErrorFlag
                                }
                            })
                            .padding(.horizontal, 15)
                    }
                    
                    //expanded version with all extra elements
                    
                    if showExpanded {
                        
                        //                    VStack (alignment: .leading) {
                        //                        Text("Notes")
                        //                            .font(Font.custom("Instrument Sans", size: 16)) // Set the custom font
                        //                            .fontWeight(.regular) // Apply weight separately
                        //                        //Notes text field
                        //                        ZStack (alignment: .top){
                        //                            RoundedRectangle(cornerRadius: 10)
                        //                                .fill(Color.gray.opacity(0.1))
                        ////                                .frame(height: 80) // Adjust height here
                        //                            TextEditor(text: $viewModel.fTask.notes)
                        //                                .padding(.horizontal, 15)
                        //                                .lineLimit(3, reservesSpace: false)
                        //
                        //                        }
                        //                    }
                        //                    .padding(.top, 5)
                        
                        VStack (alignment: .leading) {
                            Text("Tag")
                                .font(Font.custom("Instrument Sans", size: 14)) // Set the custom font
                                .fontWeight(.regular) // Apply weight separately
                            
                            //tag dropdown menu that passes in the dropdown's tag value
                            TagDropDownMenu(selectedTag: $viewModel.fTask.tag)
                            
                            
                            //                        Rectangle()
                            //                            .foregroundColor(.clear)
                            //                            .frame(height: 39)
                            //                            .background(Color(red: 0.92, green: 0.92, blue: 0.92))
                            //                            .cornerRadius(4)
                            //                        DropdownMenu
                            
                        }
                        .padding(.vertical,20)
                        
                        VStack(alignment: .leading){
                            Text("Status")
                                .font(Font.custom("Instrument Sans", size: 14)) // Set the custom font
                                .fontWeight(.regular)
                            StatusDropDownMenu(selectedStatus: $viewModel.fTask.status) // Pass as binding
                            
                            if viewModel.fTask.status == .plannedForToday{
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack{
                                        Text("Choose a Priority Category")
                                            .font(Font.custom("Helvetica", size: 14))
                                            .fontWeight(.regular)
                                    }
                                    
                                    HStack(spacing: 10) {
                                        ForEach(Priority.allCases, id: \.self) { priority in
                                            Text(priority.name.lowercased().capitalized)
                                                .font(Font.custom("Helvetica", size: 14))
                                                .foregroundColor(
                                                    (hasUserSelectedPriority
                                                     ? (selectedPriority == priority)
                                                     : (viewModel.fTask.taskAssignment?.priority == priority))
                                                    ? Color("BodyCopyReverse")
                                                    :  Color("BodyCopy")
                                                )
                                            
                                                .frame(maxWidth: .infinity, minHeight: 50)
                                                .background(
                                                    (hasUserSelectedPriority
                                                     ? (selectedPriority == priority)
                                                     : (viewModel.fTask.taskAssignment?.priority == priority))
                                                    ? Color("TagNoColor")
                                                    :  Color(.clear)
                                                )
                                                .cornerRadius(8)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .stroke(
                                                            (hasUserSelectedPriority
                                                             ? (selectedPriority == priority)
                                                             : (viewModel.fTask.taskAssignment?.priority == priority))
                                                            ? Color("BodyCopy")
                                                            :  Color(.clear), lineWidth: 1.5)
                                                )
                                                .onTapGesture {
                                                    selectedPriority = priority
                                                    hasUserSelectedPriority = true
                                                }
                                        }
                                    }
                                    .padding(5)
                                    .background(Color("FieldBackground"))
                                    .cornerRadius(12)
                                }
                                .padding(.vertical,10)
                            }
                        }
                        
                    }
                    
                    
                    //status + tag + button
                    HStack{
                        
                        //should only show if showExpanded is false
                        if !showExpanded {
                            //status
                            Button(action: {
                                showExpanded = true
                            }){
                                HStack(alignment: .center, spacing: 5) {
                                    Circle()
                                        .fill(viewModel.fTask.status.bodyColor)
                                        .frame(width: 8, height: 8)
                                    
                                    Text(viewModel.fTask.status.name)
                                        .font(Font.custom("Helvetica", size: 13))
                                        .foregroundColor(viewModel.fTask.status.bodyColor)
                                }
                                .padding(.leading, 8)
                                .padding(.trailing, 12)
                                .padding(.vertical, 4)
                                .background(viewModel.fTask.status.backgroundColor)
                                .cornerRadius(10)
                            }
                            
                            Button( action: {
                                showExpanded = true
                            }){
                                //tag
                                HStack(spacing:2){
                                    
                                    Image(systemName: "tag")
                                        .font(.system(size: 13))
                                        .foregroundColor(viewModel.fTask.tag.color)
                                    
                                    Text(viewModel.fTask.tag.name)
                                        .font(Font.custom("Helvetica", size: 13))
                                        .foregroundColor(viewModel.fTask.tag.color)
                                }
                            }
                            
                        }
                    }
                    //.padding(.bottom)
                    .padding(.top, 5)
                    
                    //buttons
    
                    
                }
                .padding(.trailing)
                .padding(.leading)
                .padding(.top)
                .padding(.bottom,6)
//                .padding()
//                //.background(Color("MainForeground"))
//                .clipShape(RoundedCorners(radius: 20, corners: [.topLeft, .topRight]))

                
            }
            HStack(){
                
                //cancel button
                Button(action: { self.onComplete(false)}) {
                                        Text("Cancel")
                                            .padding(.top)
                                            .padding(.bottom)
                                            .frame(height: 32)
                                            .foregroundStyle(Color("BodyCopy"))
                                            .underline()
                                    }
                
                
                Spacer()
                Button(action: {
                    if viewModel.fTask.name.isEmpty{
                        self.onEmptyNameError()
                    }
                    else{
                        if (viewModel.fTask.taskAssignment?.priority != selectedPriority) {
                            let tasksAlreadyInTodaysPriority = storageViewModel.getTodaysTaskForPriority(priority: selectedPriority)
                            if (tasksAlreadyInTodaysPriority.count < 3)
                            {
                                let newlyEditedTask = viewModel.createTask(with:selectedPriority)
                                self.onComplete(true)
                                
                                if let a = newlyEditedTask {
                                    storageViewModel.updateTask(a)
                                    
                                }
                            } else {
                                self.onError()
                            }
                        } else {
                            //viewModel.createTask returns nil if the task data is no-good
                            let newlyEditedTask = viewModel.createTask(with:selectedPriority)
                            self.onComplete(true)
                            
                            if let a = newlyEditedTask {
                                storageViewModel.updateTask(a)
                            }
                        }
                    }
                }) {
                    Text("Update Task ")
                        .foregroundStyle(Color("BodyCopyReverse"))
                        .padding()
                        .frame(height: 32)
                        .background(Color("SectionButtonBackground"))
                        .cornerRadius(10)
                }
            }
            .padding(.vertical,10)
            .padding(.horizontal)
            //.background(Color(.yellow))
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("FieldBackground")),
                alignment: .top
            )
            //.background(Color(.yellow))
        }
        //.background(.green)
        .background(Color("MainForeground"))
        .clipShape(RoundedCorners(radius: 25, corners: [.topLeft, .topRight]))
            
    }
}



#Preview {
    TaskEdition(viewModel: TaskCreationViewModel(), storageViewModel: TaskBankViewModel(), showExpanded: true, onComplete:{_ in }, onError: {},onEmptyNameError:{})
}
