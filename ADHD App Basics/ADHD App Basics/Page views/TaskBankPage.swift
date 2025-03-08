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
    
    
    //important: can't create functions in body. body is a special property that returns views
    var body: some View {

        VStack{
            
            //Add task button Button
            Button(action: addNewTask) {
                Text("Add New Task +")
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }
            
            
            //Tasks
            ScrollView{
                //LazyVStack only loads what's on the screen.
                LazyVStack(){
                    ForEach(allTasksList, id: \.fTaskID){ task in
                        FakeTaskCard(fTask: task)
                    }
                    
                }
                
            }
            
        }
       
        

        
    }
    
    func addNewTask(){
        let newTask  = FakeTask(fTaskName: "New Task \(allTasksList.count + 1)", fTaskID: UUID(), fTaskCompleted: false)
        allTasksList.append(newTask)
    }
}

#Preview {
    TaskBankPage()
}
