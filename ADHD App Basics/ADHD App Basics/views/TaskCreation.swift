//
//  TaskCreation.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-03-24.
//

import SwiftUI

struct TaskCreation: View {
    
    var fTask: FakeTask
    
    //keep track of overlay expansion
    @State private var showExpanded: Bool = false
    
    
    var body: some View {
        ZStack{
            //transparency background
            Color(red: 0.06, green: 0.09, blue: 0.16).opacity(0.32)
                .edgesIgnoringSafeArea(.all)
            
            //Quick View task creation view
            VStack() {
                //heading + arrow button
                HStack(alignment:.center){
                    //heading
                    Text("Task title")
                        .font(Font.custom("Instrument Sans", size: 16)) // Set the custom font
                        .fontWeight(.regular) // Apply weight separately
                    
                    Spacer()
                    
                    // arrow
                    Button(action: {
                        print("hello")
                    }) {
                        Image("chevron-double-up")
                            .foregroundColor(Color(red: 0, green: 0, blue: 0))
                    }
                    
                    
                }
                //task name text field
                Rectangle()
                .foregroundColor(.clear)
                .frame(height: 39)
                .background(Color(red: 0.92, green: 0.92, blue: 0.92))

                .cornerRadius(4)
                //TODO: need to find way to allow binding to ftaskname
//                TextField("Enter your task here")
//                , text: $task.fTaskName)
//                 .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer()
                    .frame(height: 35)
                
                HStack{
                    //status
                    HStack(alignment: .center, spacing: 5) {
                        Circle()
                            .fill(Color(red: 0.53, green: 0.53, blue: 0.53))
                            .frame(width: 8, height: 8)
                        
                        Text(fTask.fTaskStatus)
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
                        
                        Text(fTask.fTaskCategory)
                            .font(Font.custom("Helvetica", size: 18))
                            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                    }
                    
                    Spacer()
                    
                    //add Task button
                    Button(action: {print("howdy")}) {
                        Text("Add task ")
                            .padding()
                            .frame(height: 32)
                            .background(Color.black)
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                    }
                }
                                
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 168, maxHeight: 170)
            .background(Color.white)
            .clipShape(RoundedCorners(radius: 20, corners: [.topLeft, .topRight]))
            

            
            
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
    TaskCreation(fTask: FakeTask())
}
