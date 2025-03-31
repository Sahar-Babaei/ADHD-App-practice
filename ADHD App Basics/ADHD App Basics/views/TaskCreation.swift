//
//  TaskCreation.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-03-24.
//

import SwiftUI

struct TaskCreation: View {
    @State private var showExpanded: Bool = false
    @State private var selectedStatus: Status = .notStarted // New state for status
    @State private var tagDropDown: TagDropDownMenu
    
    @StateObject var viewModel = TaskCreationViewModel()
    @StateObject var storageViewModel = TaskBankViewModel()
    var onComplete: () -> Void = { }

    init(viewModel: TaskCreationViewModel, storageViewModel: TaskBankViewModel, showExpanded: Bool, onComplete: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _storageViewModel = StateObject(wrappedValue: storageViewModel)
        self.showExpanded = showExpanded
        self.onComplete = onComplete
        self.tagDropDown = TagDropDownMenu()
    }

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text("Task title")
                        .font(Font.custom("Instrument Sans", size: 16))
                        .fontWeight(.regular)
                    
                    Spacer()
                    
                    Button(action: {
                        showExpanded.toggle()
                    }) {
                        Image("chevron-double-up")
                            .foregroundColor(Color.black)
                            .rotationEffect(.degrees(showExpanded ? 180 : 0))
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.1))
                        .frame(height: 60)
                    TextField("Enter your task here", text: $viewModel.fTask.name)
                        .padding(.horizontal, 15)
                }

                if showExpanded {
                    VStack(alignment: .leading) {
                        Text("Status")
                            .font(Font.custom("Instrument Sans", size: 16))
                            .fontWeight(.regular)
                        
                        StatusDropDownMenu(selectedStatus: $selectedStatus) // Pass as binding
                    }
                }
                
                HStack {
                    if !showExpanded {
                        HStack(alignment: .center, spacing: 5) {
                            Circle()
                                .fill(selectedStatus.bodyColor) // Uses updated state
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
                    }
                }
            }
            .padding()
            .background(Color("MainForeground"))
            .clipShape(RoundedCorners(radius: 20, corners: [.topLeft, .topRight]))
            .overlay(
                RoundedCorners(radius: 20, corners: [.topLeft, .topRight])
                    .stroke(Color("BodyCopy"), lineWidth: 1)
            )
        }
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
    TaskCreation(viewModel: TaskCreationViewModel(), storageViewModel: TaskBankViewModel(), showExpanded: false, onComplete:{})
}
