//
//  TodaysTaskElement.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-04-08.
//

import SwiftUI

struct TodaysTaskElement: View {
    
    @ObservedObject var viewModel : TaskBankViewModel
    var fTask : Task
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {

            //checkbox
            Checkbox(isChecked: fTask.status == .completed ) { isChecked in
                var task = fTask
                if isChecked {
                    
                    task.status = .completed
                   
                }
                else{
                    task.status = .plannedForToday
                   
                }
                viewModel.updateTask(task)
                
            }


            //task title
            Text(fTask.name)
                .frame(maxWidth: .infinity, alignment: .leading)

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
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color("BodyCopy"))

            }

        }
        .padding(.horizontal, 0)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .cornerRadius(10)
        .background(.green)
    }
}

#Preview {
    TodaysTaskElement(viewModel: TaskBankViewModel(), fTask: Task())
}
