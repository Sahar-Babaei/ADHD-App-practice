//
//  TodaysTaskElement.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-04-08.
//

import SwiftUI

struct TodaysTaskElement: View {
    
    @ObservedObject var viewModel : TaskBankViewModel
    @State var fTask : Task
    @State var crossOutTitle : Bool = false
    
    var body: some View {
        HStack(alignment: .top , spacing: 12) {

            //checkbox
            Checkbox(isChecked: fTask.status == .completed ) { isChecked in
                var task = fTask
                if isChecked {
                    
                    task.status = .completed
                    crossOutTitle = true
                   
                }
                else{
                    task.status = .plannedForToday
                    crossOutTitle = false
                   
                }
                viewModel.updateTask(task)
                
            }
            .padding(.top,2)



            //task title
            Text(fTask.name)
                .font(Font.custom("Instrument Sans", size: 16))
                .fontWeight(.medium)
                .strikethrough(crossOutTitle, color: Color("BodyCopy"))
                .frame(maxWidth: .infinity, alignment: .leading)
                //.background(.purple)


            // ... button
            Menu {

                Button("Edit") {
                    // Implement edit functionality here
                }
                Button("Remove from today", role: .destructive) {
                    //remove functionality
                    var task = fTask
                    if task.status != .completed{
                        task.status = .notStarted
                    }
                    task.taskAssignment = nil
                    viewModel.updateTask(task)
                    
                    

                }
            } label: {
                Image("vertical-more")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color("BodyCopy"))
                    

            }
            //.padding(.top,2)
            //.background(.orange)
            //.padding(.leading, 10)
   

        }
   //     .padding(.horizontal, 0)
        .padding(.vertical, 4)
        .padding(.leading, 18)
        .padding(.trailing, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        //.background(.yellow)
    }
}

#Preview {
    TodaysTaskElement(viewModel: TaskBankViewModel(), fTask: Task())
}
