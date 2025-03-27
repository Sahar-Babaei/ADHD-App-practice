//
//  TaskCreation.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-03-24.
//

import SwiftUI

struct TaskCreation: View {
    
    //keep track of overlay expansion
    @State private var showExpanded: Bool = false
    
    @StateObject var viewModel = TaskCreationViewModel()
    @StateObject var storageViewModel = TaskBankViewModel()
    
    init(viewModel: TaskCreationViewModel, storageViewModel: TaskBankViewModel, showExpanded: Bool) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _storageViewModel = StateObject(wrappedValue: storageViewModel)
        self.showExpanded = showExpanded
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
                        .font(Font.custom("Instrument Sans", size: 16)) // Set the custom font
                        .fontWeight(.regular) // Apply weight separately
                    
                    Spacer()
                    
                    // arrow
                    Button(action: {
                        showExpanded.toggle()
                        print(showExpanded)
                    }) {
                        //only rotate chevron icon downward when showExpanded is true
                        Image("chevron-double-up")
                            .foregroundColor(Color(red: 0, green: 0, blue: 0))
                            .rotationEffect(.degrees(showExpanded ? 180 : 0 ))
                    }
                }
                
                //task name text field
                //TODO: mentor - need to find way to allow binding to ftaskname
                TextField("Enter your task here", text: $viewModel.fTask.fTaskName)
                    .textFieldStyle(.plain)
                    .background((Color(red: 0.92, green: 0.92, blue: 0.92)))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                //expanded version with all extra elements
                
                if showExpanded {
                    
                    VStack (alignment: .leading) {
                        Text("Notes")
                            .font(Font.custom("Instrument Sans", size: 16)) // Set the custom font
                            .fontWeight(.regular) // Apply weight separately
                        //Notes text field
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 80)
                            .background(Color(red: 0.92, green: 0.92, blue: 0.92))
                            .cornerRadius(4)
                        
                    }
                    .padding(.top, 5)
                    
                    VStack (alignment: .leading) {
                        Text("Tag")
                            .font(Font.custom("Instrument Sans", size: 16)) // Set the custom font
                            .fontWeight(.regular) // Apply weight separately
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 39)
                            .background(Color(red: 0.92, green: 0.92, blue: 0.92))
                            .cornerRadius(4)
                        
                    }
                    .padding(.top, 5)
                    
                }
                
                Spacer()
                    .frame(height: 35)
                
                //status + tag + button
                HStack{
                    
                    //should only show if showExpanded is false
                    if !showExpanded {
                        //status
                        HStack(alignment: .center, spacing: 5) {
                            Circle()
                                .fill(Color(red: 0.53, green: 0.53, blue: 0.53))
                                .frame(width: 8, height: 8)
                            
                            Text(viewModel.fTask.fTaskStatus)
                                .font(Font.custom("Helvetica", size: 17))
                                .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                        }
                        .padding(.leading, 8)
                        .padding(.trailing, 12)
                        .padding(.vertical, 4)
                        .background(.black.opacity(0.1))
                        .cornerRadius(10)
                        
                        //tag
                        HStack(spacing:2){
                            
                            Image(systemName: "tag")
                                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                            
                            Text(viewModel.fTask.fTaskCategory)
                                .font(Font.custom("Helvetica", size: 18))
                                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                        }
                        
                        
                    }
                    
                    Spacer()
                    //add Task button
                    Button(action: {
                        //viewModel.createTask returns nil if the task data is no-good
                        let newlyCreatedTask = viewModel.createTask()
                        
                        //only add to storage if the task was successfully created (aka, it's not nil)
                        if let a = newlyCreatedTask {
                            storageViewModel.addTask(a)
                        }
                    }) {
                        Text("Add task ")
                            .padding()
                            .frame(height: 32)
                            .background(Color.black)
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                    }
                }
                
            }
            .padding(.horizontal)
            .background(Color.white)
            .clipShape(RoundedCorners(radius: 20, corners: [.topLeft, .topRight]))
        }.background(Color(red: 0.06, green: 0.09, blue: 0.16).opacity(0.32))
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
    TaskCreation(viewModel: TaskCreationViewModel(), storageViewModel: TaskBankViewModel(), showExpanded: false)
}
