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
                    Button (action: {}){
                        HStack(alignment: .center, spacing: 3) {
                            Image("menu-tab-4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18, height: 18)
                                .foregroundColor(Color("BodyCopy"))
                            //.background(.green)
                            
                            Text("Manage Tasks")
                                .font(Font.custom("Helvetica", size: 16))
                                .foregroundColor(Color("BodyCopy"))
                        }
                        .padding(.leading,14)
                        .padding(.trailing,18)
                        .padding(.vertical, 10)
                        .background(Color(.yellow))
                        .cornerRadius(40)
                        
                    }
                    
                    
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                
                ScrollView{
                    //contianer for 3 sections
                    
                    
                    VStack(alignment: .center, spacing: 18) {
                        
                        //Must do section
                        VStack(alignment: .center, spacing: 5) {
                            //header part
                            HStack(alignment: .center) {
                                
                                Text("MUST DO TODAY")
                                    .font(Font.custom("Helvetica", size: 14))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("BodyCopy"))
                                    .background(.orange)
                                
                                Spacer()
                                
                            }
                            .padding(.leading, 12)
                            .padding(.trailing, 6)
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(.green)
                            
                            
                            //three tasks
                            VStack(alignment: .leading, spacing: 12) {
                                
                                ForEach(viewModel.getAllTasksForPriority(priority: Priority.mustDo), id: \.ID.uuidString) { task in
                                    HStack(alignment: .center, spacing: 12) {

                                        //checkbox
                                        Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 18, height: 18)
                                        .cornerRadius(5)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                        .inset(by: 0.75)
                                        .stroke(Color(red: 0.26, green: 0.26, blue: 0.26), lineWidth: 1.5)

                                        )

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
                        .frame(width: 369, alignment: .top)
                        .background(.green)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .inset(by: 0.5)
                                .stroke(.white, lineWidth: 1)
                        )
                        
                        //if time allows section
                        VStack(alignment: .center, spacing: 5) {
                            //header part
                            HStack(alignment: .center) {
                                
                                Text("DO IF TIME ALLOWS")
                                    .font(Font.custom("Helvetica", size: 14))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("BodyCopy"))
                                    .background(.orange)
                                
                                Spacer()
                                
                            }
                            .padding(.leading, 12)
                            .padding(.trailing, 6)
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(.green)
                            
                            
                            //three tasks
                            VStack(alignment: .leading, spacing: 12) {
                                
                                ForEach(viewModel.getAllTasksForPriority(priority: Priority.doIfPossible), id: \.ID.uuidString) { task in
                                    HStack(alignment: .center, spacing: 12) {

                                        //checkbox
                                        Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 18, height: 18)
                                        .cornerRadius(5)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                        .inset(by: 0.75)
                                        .stroke(Color(red: 0.26, green: 0.26, blue: 0.26), lineWidth: 1.5)

                                        )

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
                        .frame(width: 369, alignment: .top)
                        .background(.green)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .inset(by: 0.5)
                                .stroke(.white, lineWidth: 1)
                        )
                        
                        //Nice to do section
                        VStack(alignment: .center, spacing: 5) {
                            //header part
                            HStack(alignment: .center) {
                                
                                Text("NICE TO DO")
                                    .font(Font.custom("Helvetica", size: 14))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("BodyCopy"))
                                    .background(.orange)
                                
                                Spacer()
                                
                            }
                            .padding(.leading, 12)
                            .padding(.trailing, 6)
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(.green)
                            
                            
                            //three tasks
                            VStack(alignment: .leading, spacing: 12) {
                                
                                ForEach(viewModel.getAllTasksForPriority(priority: Priority.niceToDo), id: \.ID.uuidString) { task in
                                    HStack(alignment: .center, spacing: 12) {

                                        //checkbox
                                        Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 18, height: 18)
                                        .cornerRadius(5)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                        .inset(by: 0.75)
                                        .stroke(Color(red: 0.26, green: 0.26, blue: 0.26), lineWidth: 1.5)

                                        )

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
                        .frame(width: 369, alignment: .top)
                        .background(.green)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .inset(by: 0.5)
                                .stroke(.white, lineWidth: 1)
                        )
                        
                    }
                    
                    //.padding()
                    //.frame(maxWidth:.infinity, alignment: .top)
                }.onAppear {
                    viewModel.loadAllTasks()
                }
                
                
                
                
                
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("MainBackground"))
            
            
        }
        
        
    }
}

#Preview {
    TodaysPage(viewModel: TaskBankViewModel())
}
