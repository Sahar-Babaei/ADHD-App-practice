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
    var onEdit: ((Task) -> Void) = {_ in }
    
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
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 10)

                
                //the sections
                ScrollView{
                    //contianer for 3 sections
                    VStack(alignment: .center, spacing: 14) {
                        
                        //Must do section
                        VStack(alignment: .center, spacing: 5) {
                            //header part
                            HStack(alignment: .center) {
                                
                                Text("1. MUST DO TODAY")
                                    .font(Font.custom("Helvetica", size: 16))
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
                          
                                        
                                        Text("Add Tasks")
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
                            .padding(.leading, 15)
                            .padding(.trailing, 10)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color("MainBackground")),
                                alignment: .bottom
                            )
                            
                            //three tasks
                            VStack(alignment: .leading, spacing: 10) {
                                
                                ForEach(viewModel.getAllTasksForPriority(priority: Priority.mustDo), id: \.ID.uuidString) { task in
                                    
                                    TodaysTaskElement(viewModel: viewModel, fTask: task,onEdit:{onEdit(task)} )
                                }
                            }
                            .padding(.top, 6)
                        }
                        .padding(.top, 0)
                        .padding(.bottom, 18)
                        .background(Color("MainForeground"))
                        .cornerRadius(15)
                        .padding(.horizontal, 12)

                        
                        
                        
                        //if time allows section
                        VStack(alignment: .center, spacing: 5) {
                            //header part
                            HStack(alignment: .center) {
                                
                                Text("2. DO IF TIME ALLOWS")
                                    .font(Font.custom("Helvetica", size: 16))
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
                                        
                                        Text("Add Tasks")
                                            .font(Font.custom("Helvetica", size: 15))
                                            .foregroundColor(Color("BodyCopyReverse"))
                                    }
                                    .padding(.leading,10)
                                    .padding(.trailing,16)
                                    .padding(.vertical, 8)
                                    .background(Color("SectionButtonBackground"))
                                    .cornerRadius(40)
                                    
                                }
                                
                            }
                            .padding(.leading, 15)
                            .padding(.trailing, 10)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color("MainBackground")),
                                alignment: .bottom
                            )

                            
                            //three tasks
                            VStack(alignment: .leading, spacing: 10) {
                                
                                ForEach(viewModel.getAllTasksForPriority(priority: Priority.doIfPossible), id: \.ID.uuidString) { task in
                                    
                                    TodaysTaskElement(viewModel: viewModel, fTask: task, onEdit:{onEdit(task)})

                                }
                            }
                            .padding(.top, 6)
                        }
                        .padding(.top, 0)
                        .padding(.bottom, 18)
                        .background(Color("MainForeground"))
                        .cornerRadius(15)
                        .padding(.horizontal, 12)

                        
                        //Nice to do section
                        VStack(alignment: .center, spacing: 5) {
                            //header part
                            HStack(alignment: .center) {
                                
                                Text("3. NICE TO DO")
                                    .font(Font.custom("Helvetica", size: 16))
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
                                        
                                        
                                        Text("Add Tasks")
                                            .font(Font.custom("Helvetica", size: 15))
                                            .foregroundColor(Color("BodyCopyReverse"))
                                    }
                                    .padding(.leading,10)
                                    .padding(.trailing,16)
                                    .padding(.vertical, 8)
                                    .background(Color("SectionButtonBackground"))
                                    .cornerRadius(40)
                                    
                                }
                                
                            }
                            .padding(.leading, 15)
                            .padding(.trailing, 10)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color("MainBackground")),
                                alignment: .bottom
                            )
                            //.background(.green)
                            
                            
                            //three tasks
                            VStack(alignment: .leading, spacing: 10) {
                                
                                ForEach(viewModel.getAllTasksForPriority(priority: Priority.niceToDo), id: \.ID.uuidString) { task in
                                    
                                    TodaysTaskElement(viewModel: viewModel, fTask: task, onEdit:{onEdit(task)})
                                }
                            }
                            .padding(.top, 6)
                        }
                        .padding(.top, 0)
                        .padding(.bottom, 18)
                        .background(Color("MainForeground"))
                        .cornerRadius(15)
                        .padding(.horizontal, 12)

                    }
                    

                }.onAppear {
                    viewModel.loadAllTasks()
                }
                .padding(.bottom,74)
                //.padding(.horizontal, 12)
                
                
                
                
                
                
                
            }
            
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("MainBackground"))
            
            
        }
        
        
    }
}

#Preview {
    TodaysPage(viewModel: TaskBankViewModel())
}
