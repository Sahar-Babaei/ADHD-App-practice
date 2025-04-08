//
//  TodaysPage.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-04-03.
//

import SwiftUI
import Foundation

struct TodaysPage: View {
    
    @ObservedObject var viewModel : TaskBankViewModel
    
    var a :String {
        //"a hello"
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d, yyyy"  // ✅ Short weekday, short month, day, full year

        let today = Date()
        return formatter.string(from: today)
    }
    
    var body: some View {
        
        NavigationStack {
            VStack(){
                
                //top bar
                HStack(alignment:.bottom){
                    //name + date
                    VStack(alignment:.leading, spacing:5){
                        
                        //page title
                        Text("Today's Tasks")
                            .font(Font.custom("Helvetica", size: 26))
                            .fontWeight(.bold)
                            .foregroundColor(Color("BodyCopy"))
                        
                        
                        
                        //TODO: mentor? how do we get today's date displayed here?
                        Text(a)
                            .font(Font.custom("Helvetica", size: 15))
                            .foregroundColor(Color("BodyCopy"))
                        

                        
                    }
                    
                    Spacer()
                    
                    //add task button
//                    Button (action: {}){
//                        HStack(alignment: .center, spacing: 3) {
//                            Image("menu-tab-4")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 18, height: 18)
//                                .foregroundColor(Color("BodyCopy"))
//                            //.background(.green)
//                            
//                            Text("Add Today's Tasks")
//                                .font(Font.custom("Helvetica", size: 16))
//                                .foregroundColor(Color("BodyCopy"))
//                        }
//                        .padding(.leading,14)
//                        .padding(.trailing,18)
//                        .padding(.vertical, 10)
//                        .background(Color(.yellow))
//                        .cornerRadius(40)
//                        
//                    }
                    
                    
                }
                
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .background(.purple)
                
                //the sections
                ScrollView{
                    //contianer for 3 sections
                    
                    
                    VStack(alignment: .center, spacing: 18) {
                        
                        //Must do section
                        VStack(alignment: .center, spacing: 5) {
                            //header part
                            HStack(alignment: .center) {
                                
                                Text("MUST DO TODAY")
                                    .font(Font.custom("Helvetica", size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("BodyCopy"))
                                    
                                
                                Spacer()
                                Button (action: {}){
                                    HStack(alignment: .center, spacing: 3) {
                                        Image("menu-tab-4")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(Color("BodyCopyReverse"))
                                        //.background(.green)
                                        
                                        Text("Manage Tasks")
                                            .font(Font.custom("Helvetica", size: 15))
                                            .foregroundColor(Color("BodyCopyReverse"))
                                    }
                                    .padding(.leading,10)
                                    .padding(.trailing,16)
                                    .padding(.vertical, 9)
                                    .background(Color("SectionButtonBackground"))
                                    .cornerRadius(40)
                                    
                                }
                                
                            }
                            .padding(.leading, 12)
                            .padding(.trailing, 6)
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity, alignment: .center)
                            //.background(.green)
                            
                            
                            //three tasks
                            VStack(alignment: .leading, spacing: 12) {
                                
                                ForEach(viewModel.getAllTasksForPriority(priority: Priority.mustDo), id: \.ID.uuidString) { task in
                                    HStack(alignment: .center, spacing: 12) {


                                        //task title
                                        Text(task.name)


                                        // ... button
                                        Menu {

                                            Button("Edit") {
                                                // Implement edit functionality here
                                            }
                                            Button("Remove", role: .destructive) {
                                                //remove functionality

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
                                    .background(.white)
                                }
                      
                            }
                            .padding(.leading, 15)
                            .padding(.trailing, 10)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .background(.yellow)
                            

                            
                            
                        }
                        .padding(.horizontal, 0)
                        .padding(.top, 0)
                        .padding(.bottom, 10)
                        //.frame(width: 369, alignment: .top)
                       // .background(.green)
                        .background(Color("MainForeground"))
                        .cornerRadius(15)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 15)
//                                .inset(by: 0.5)
//                                .stroke(.white, lineWidth: 1)
//                        )
                        
                        //if time allows section
                        VStack(alignment: .center, spacing: 5) {
                            //header part
                            HStack(alignment: .center) {
                                
                                Text("DO IF TIME ALLOWS")
                                    .font(Font.custom("Helvetica", size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("BodyCopy"))
                                    
                                
                                Spacer()
                                Button (action: {}){
                                    HStack(alignment: .center, spacing: 3) {
                                        Image("menu-tab-4")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(Color("BodyCopyReverse"))
                                        //.background(.green)
                                        
                                        Text("Manage Tasks")
                                            .font(Font.custom("Helvetica", size: 15))
                                            .foregroundColor(Color("BodyCopyReverse"))
                                    }
                                    .padding(.leading,10)
                                    .padding(.trailing,16)
                                    .padding(.vertical, 9)
                                    .background(Color("SectionButtonBackground"))
                                    .cornerRadius(40)
                                    
                                }
                                
                            }
                            .padding(.leading, 12)
                            .padding(.trailing, 6)
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity, alignment: .center)
                            //.background(.green)
                            
                            
                            //three tasks
                            VStack(alignment: .leading, spacing: 12) {
                                
                                ForEach(viewModel.getAllTasksForPriority(priority: Priority.doIfPossible), id: \.ID.uuidString) { task in
                                    HStack(alignment: .center, spacing: 12) {

                                        //checkbox
                                        Checkbox(isChecked: task.status == .completed ) { isChecked in
                                            var task = task
                                            if isChecked {
                                                
                                                task.status = .completed
                                               
                                            }
                                            else{
                                                task.status = .plannedForToday
                                               
                                            }
                                            viewModel.updateTask(task)
                                            
                                        }


                                        //task title
                                        Text(task.name)
                                            .frame(maxWidth: .infinity, alignment: .leading)

                                        // ... button
                                        Menu {

                                            Button("Edit") {
                                                // Implement edit functionality here
                                            }
                                            Button("Remove from today", role: .destructive) {
                                                //remove functionality
                                                var task = task
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
                            .padding(.leading, 15)
                            .padding(.trailing, 10)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .background(.yellow)
                            

                            
                            
                        }
                        .padding(.horizontal, 0)
                        .padding(.top, 0)
                        .padding(.bottom, 10)
                        //.frame(width: 369, alignment: .top)
                        //.background(.green)
                        .background(Color("MainForeground"))
                        .cornerRadius(15)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 15)
//                                .inset(by: 0.5)
//                                .stroke(.white, lineWidth: 1)
//                        )
                        
                        //Nice to do section
                        VStack(alignment: .center, spacing: 5) {
                            //header part
                            HStack(alignment: .center) {
                                
                                Text("NICE TO DO")
                                    .font(Font.custom("Helvetica", size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("BodyCopy"))
                                  
                                
                                Spacer()
                                
                                Button (action: {}){
                                    HStack(alignment: .center, spacing: 3) {
                                        Image("menu-tab-4")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(Color("BodyCopyReverse"))
                                        
                                        
                                        Text("Manage Tasks")
                                            .font(Font.custom("Helvetica", size: 15))
                                            .foregroundColor(Color("BodyCopyReverse"))
                                    }
                                    .padding(.leading,10)
                                    .padding(.trailing,16)
                                    .padding(.vertical, 9)
                                    .background(Color("SectionButtonBackground"))
                                    .cornerRadius(40)
                                    
                                }
                                
                            }
                            .padding(.leading, 12)
                            .padding(.trailing, 6)
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity, alignment: .center)
                            //.background(.green)
                            
                            
                            //three tasks
                            VStack(alignment: .leading, spacing: 12) {
                                
                                ForEach(viewModel.getAllTasksForPriority(priority: Priority.niceToDo), id: \.ID.uuidString) { task in
                                    HStack(alignment: .center, spacing: 12) {


                                        //task title
                                        Text(task.name)


                                        // ... button
                                        Menu {

                                            Button("Edit") {
                                                // Implement edit functionality here
                                            }
                                            Button("Remove", role: .destructive) {
                                                //remove functionality

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
                                    .background(.white)
                                }
                                
                            }
                            .padding(.leading, 15)
                            .padding(.trailing, 10)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .background(.yellow)
                            

                            
                            
                        }
                        .padding(.horizontal, 0)
                        .padding(.top, 0)
                        .padding(.bottom, 10)
//                        .frame(width: 369, alignment: .top)
                        //.background(.green)
                        .background(Color("MainForeground"))
                        .cornerRadius(15)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 15)
//                                .inset(by: 0.5)
//                                .stroke(.white, lineWidth: 1)
//                        )
                        
                    }
                    
                    
                    //.padding()
                    //.frame(maxWidth:.infinity, alignment: .top)
                }.onAppear {
                    viewModel.loadAllTasks()
                }
                .background(.blue)
                //.padding(.top, 5)
                .padding(.bottom,74)
                .padding(.horizontal, 12)
                
                
                
                
                
                
                
            }
            
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("MainBackground"))
            
            
        }
        
        
    }
}

#Preview {
    TodaysPage(viewModel: TaskBankViewModel())
}
