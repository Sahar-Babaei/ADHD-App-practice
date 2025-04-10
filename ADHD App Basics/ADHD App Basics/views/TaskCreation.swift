//
//  TaskCreation.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-03-24.
//

import SwiftUI

struct TaskCreation: View {
    
    //keep track of overlay expansion
    @State private var selectedStatus: Status = .notStarted // New state for status
    @State private var selectedTag: Tag = .none
    @State private var selectedPriority: Priority = .niceToDo
    //@Binding var selectedPriority: Priority
    @State private var showExpanded: Bool = false
    //    @State private var tagDropDown: TagDropDownMenu
    //    @State private var userSelectedStatus: Status = $selectedStatus
    //@State private var statusDropDown: StatusDropDownMenu
    
    //    var dropdown
    
    @State private var text: String = ""
    @StateObject var viewModel = TaskCreationViewModel()
    @StateObject var storageViewModel = TaskBankViewModel()
    var onComplete : (Bool) -> Void = { _ in }
    
    init(viewModel: TaskCreationViewModel, storageViewModel: TaskBankViewModel, showExpanded: Bool , onComplete: @escaping (Bool) -> Void) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _storageViewModel = StateObject(wrappedValue: storageViewModel)
        self.showExpanded = showExpanded
        self.onComplete = onComplete //not invoking, just saving.
        //        self.tagDropDown = TagDropDownMenu()
        //self.statusDropDown = StatusDropDownMenu()
      //  self.selectedPriority = selectedPriority
    }
    
    var body: some View {
        
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
//                            .rotationEffect(.degrees(showExpanded ? 180 : 0))
//                                .animation(.easeInOut(duration: 0.3), value: showExpanded)
                    }
                }
                
                //task name text field
                //TODO: mentor - need to find way to allow binding to name
                //                TextField("Enter your task here", text: $viewModel.fTask.name)
                //                    .padding(.vertical, 12) // Adds internal padding
                //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.1))
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
                        TagDropDownMenu(selectedTag: $selectedTag)

                        
                    }
                    .padding(.vertical,20)
                    
                    
                    VStack(alignment: .leading){
                        Text("Status")
                            .font(Font.custom("Instrument Sans", size: 14)) // Set the custom font
                            .fontWeight(.regular)
                        StatusDropDownMenu(selectedStatus: $selectedStatus) // Pass as binding
                        
                        if selectedStatus == .plannedForToday{

                                VStack(alignment: .leading, spacing: 10) {
                                    HStack{
                                        Text("Choose a Priority Category")
                                            .font(Font.custom("Helvetica", size: 14))
                                            .fontWeight(.regular)
                                    }


                                    HStack(spacing: 10) {
                                        ForEach(Priority.allCases, id: \.self) { priority in
                                            Text(priority.name.lowercased().capitalized)
                                                .font(Font.custom("Helvetica", size: 13))
                                                .foregroundColor(Color("BodyCopy"))
                                            
                                                .frame(maxWidth: .infinity, minHeight: 45)
                                                .background(selectedPriority == priority ? Color.yellow : Color.gray.opacity(0.2))
                                                .cornerRadius(8)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .stroke(selectedPriority == priority ? Color.orange : Color.clear, lineWidth: 2)
                                                )
                                                .onTapGesture {
                                                    selectedPriority = priority
                                                }
                                        }
                                    }
                                    .padding(4)
                                    .background(.gray)
                                    .cornerRadius(12)
                                    
                            }
                               

                            .padding(.vertical,10)

                        }
                    }
                    
                }
                
                //                Spacer()
                //                    .frame(height: 35)
                
                //status + tag + button
                HStack{
                    
                    //should only show if showExpanded is false
                    if !showExpanded {
                        //status
                        HStack(alignment: .center, spacing: 5) {
                            Circle()
                                .fill(selectedStatus.bodyColor)
                                .frame(width: 8, height: 8)
                            
                            Text(selectedStatus.name)
                                .font(Font.custom("Helvetica", size: 13))
                                .foregroundColor(selectedStatus.bodyColor)
                        }
                        .padding(.leading, 8)
                        .padding(.trailing, 12)
                        .padding(.vertical, 4)
                        .background(selectedStatus.backgroundColor)
                        .cornerRadius(10)
                        
                        //tag
                        HStack(spacing:2){
                            
                            Image(systemName: "tag")
                                .foregroundColor(selectedTag.color)
                            
                            Text(selectedTag.name)
                                .font(Font.custom("Helvetica", size: 13))
                                .foregroundColor(selectedTag.color)
                        }
                    }
                }
                .padding(.bottom)
                .padding(.top, 5)
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
                    Button(action: {
                        //viewModel.ftask... tied the dropdown tag and status values to the Task's tag and status values
                        viewModel.fTask.tag = selectedTag
                        viewModel.fTask.status = selectedStatus
                        
                        //viewModel.createTask returns nil if the task data is no-good
                        let newlyCreatedTask = viewModel.createTask(with:selectedPriority)
                        self.onComplete(true)
                        
                        
                        //only add to storage if the task was successfully created (aka, it's not nil)
                        if let a = newlyCreatedTask {
                            storageViewModel.addTask(a)
                            // put a flag here to make it all disapear
                            
                        }
                        
                    }) {
                        Text("Create task ")
                            .padding()
                            .frame(height: 32)
                            .background(Color.black)
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                    }
                    
                    
                }
                
            }
            .padding()
            .background(Color("MainForeground"))
            .clipShape(RoundedCorners(radius: 20, corners: [.topLeft, .topRight]))
            
//            .overlay(
//                RoundedCorners(radius: 20, corners: [.topLeft, .topRight])
//                    .stroke(Color("BodyCopy"), lineWidth: 1)
//            )
            
            
        }//.background(Color(red: 0.06, green: 0.09, blue: 0.16).opacity(0.32))
        //.background(Color(.red))
        //.background(.ultraThinMaterial)
        
    }
}

struct RoundedCorners: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
        
    }
}

#Preview {
    TaskCreation(viewModel: TaskCreationViewModel(), storageViewModel: TaskBankViewModel(), showExpanded: false, onComplete:{_ in })
}
