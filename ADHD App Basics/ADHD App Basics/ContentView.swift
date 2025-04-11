//
//  ContentView.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-02-14.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @State private var selectedTab = 1
    // variable for changing tabs
    @State private var showTaskCreationOverlay: Bool = false
    @State private var showTaskEditionOverlay: Bool = false
    @StateObject private var viewModel: MainViewModel = .init()
    @StateObject private var myViewModel: TaskBankViewModel = .init()
    @StateObject private var taskEditionViewModel: TaskCreationViewModel = .init()
    //navigation path:
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            ZStack(alignment: .bottom){
                //MARK: - Content for each tab's page
                VStack{
                    
                    switch selectedTab{
                    case 1:
                        //make enums for name of each tab instead of 1,2,3,...
                        //Text ("this is tab 1 lol")
                        TodaysPage(viewModel: myViewModel,onEdit:{selectedTask in
                            taskEditionViewModel.fTask = selectedTask
                            showTaskEditionOverlay = true
                        }, onError: {
                            viewModel.errorToast()
                        })
                    case 2:
                       // Text ("this is tab 2 lol lol ")
                        TaskBankPage(viewModel: myViewModel, onEdit:{selectedTask in
                            taskEditionViewModel.fTask = selectedTask
                            showTaskEditionOverlay = true
                        })
                        
                    case 3:
                        SettingsPage()
                    case 4:
                        Text ("this is tab 4 lol lol lol lol")
                    default: //if we do an enum, the default is not necessary. only for ints
                        Text ("this tab doesn't exist")
                        //TODO: Mentor? is using switch a good idea? the default case seems pointless...
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                //note: somehow this verically centers the text but i don't know why it doesn't automatically happen.
                
                //The toast
                if ( viewModel.creationToastVisible) {
                    HStack(alignment: .center){
                        
                        Image("success-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("ToastSuccessBody"))
                        
                        Text("You created a task!")
                            .font(Font.custom("Helvetica", size: 16))
                            .foregroundColor(Color("ToastSuccessBody"))
                    }
                    .frame(maxHeight: 55)
                    .frame(maxWidth: 200)
                    .background(Color("ToastSuccessBackground"))
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.15), radius: 2, x: 0, y: 2)
                    .overlay(
                    RoundedRectangle(cornerRadius: 15)
                    .inset(by: 0.5)
                    .stroke(Color("ToastSuccessBody"), lineWidth: 1)

                    )
                
                
                    .padding(.bottom, 680)
                    
                }
                
                if ( viewModel.editionToastVisible) {
                    HStack(){
                        
                        Image("success-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("ToastSuccessBody"))
                        
                        Text("Edited Successfully!")
                            .font(Font.custom("Helvetica", size: 16))
                            .foregroundColor(Color("ToastSuccessBody"))
                    }
                    .frame(maxHeight: 55)
                    .frame(maxWidth: 210)
                    .background(Color("ToastSuccessBackground"))
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.15), radius: 2, x: 0, y: 2)
                    .overlay(
                    RoundedRectangle(cornerRadius: 15)
                    .inset(by: 0.5)
                    .stroke(Color("ToastSuccessBody"), lineWidth: 1)

                    )
                
                
                    .padding(.bottom, 680)
                    
                    
                }
                
                //MARK: - the tabs
                ZStack(alignment: .leading){
                    
                    
                    
                    //--> HStack for 3 tabs
                    VStack(){
                        
                        Spacer()
                            .frame(height:80)
                        HStack(alignment: .center, spacing: 10){
                            
                            //tab 1
                            Button (action: {selectedTab = 1}){
                                VStack{
                                    Image("menu-tab-1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 26, height: 26)
                                        .foregroundColor(Color("BodyCopy"))
                                    
                                    //for the bg
                                        .padding(.vertical, 15)
                                        .padding(.horizontal, 25)
                                    
                                    //.background(.white.opacity(0.3))
                                        .background(selectedTab == 1 ? Color("BodyCopyReverse").opacity(0.22) : .clear )
                                    
                                        .cornerRadius(30)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 48)
                                                .inset(by: 0.5)
                                                .stroke(selectedTab == 1 ? Color(.gray.opacity(0.25)): .clear )
                                        )
                                }
                            }

                            //tab 2
                            Button (action: {selectedTab = 2}){
                                VStack{
                                    Image("menu-tab-2")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 26, height: 26)
                                        .foregroundColor(Color("BodyCopy"))
                                    
                                    //for the bg
                                        .padding(.vertical, 15)
                                        .padding(.horizontal, 25)
                                    
                                    //.background(.white.opacity(0.3))
                                        .background(selectedTab == 2 ? Color("BodyCopyReverse").opacity(0.22) : .clear )
                                    
                                        .cornerRadius(30)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 48)
                                                .inset(by: 0.5)
                                                .stroke(selectedTab == 2 ? Color(.gray.opacity(0.25)): .clear )
                                        )
                                }
                            }

                            
                            //tab 3
                            Button (action: {selectedTab = 3}){
                                VStack{
                                    Image("menu-tab-3")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 26, height: 26)
                                        .foregroundColor(Color("BodyCopy"))
                                    
                                    //for the bg
                                        .padding(.vertical, 15)
                                        .padding(.horizontal, 25)
                                    
                                    //.background(.white.opacity(0.3))
                                        .background(selectedTab == 3 ? Color("BodyCopyReverse").opacity(0.22) : .clear )
                                    
                                        .cornerRadius(30)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 48)
                                                .inset(by: 0.5)
                                                .stroke(selectedTab == 3 ? Color(.gray.opacity(0.25)): .clear )
                                            
                                        )
  
                                }
                            }
                            
                            
                        }
                        //.background(Color.yellow)
                        .padding(.horizontal, 20)
                        .padding(.top, 16)
                        //.padding(.bottom, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        //Don't deleted this commented out below
                        //
                        //                    .overlay(
                        //                        Rectangle()
                        //                            .fill(Color.green)
                        //                            .frame(height: 1),
                        //                        alignment:.top
                        //                            //.inset(by: 0.5)
                        //                            //.stroke(Color(red: 0.4, green: 0.4, blue: 0.4), lineWidth: 1)
                        //                    )
                       // .background(Color("MenuBackground").opacity(0.1))
                        .background(Color("BodyCopy").opacity(0.15))
                        .background(.ultraThinMaterial)
                        
                        //.blur(radius: 40)
                        //.blur(radius: 2, opaque: false)
                        //.background(.thinMaterial)
                        //.background(.ultraThinMaterial)
                        

                        
                    }
                    
                    
                    
                    // --> HStack all of this is for the plus (+) button section
                    VStack{
                        //Spacer()
                        
                        HStack(alignment: .center){
                            HStack(alignment: .center, spacing: 10){
                                
                                //tab 4
                                Button (action: {
                                    showTaskCreationOverlay = true
                                }){
                                    VStack{
                                        Image("menu-tab-4")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(Color("BodyCopy"))
                                        
                                    }.padding(30)
                                }
                                
                            }
//                            .padding(30)
                            
//                            .background(selectedTab == 4 ? Color("MenuButtonBackground").opacity(0.2) : Color("MenuButtonBackground"))
                            .background(selectedTab == 4 ? Color("BodyCopy").opacity(0.3) : Color("BodyCopy").opacity(0.1))
                            .background(.ultraThinMaterial) //Delete this if it doesn't make it transparent
                            
                            .cornerRadius(57)
                            .overlay(
                                RoundedRectangle(cornerRadius: 57)
                                    .inset(by: 0.5)
                                    //.stroke(Color("MainForeground"), lineWidth: 1)
                                    .stroke(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color("CreateButtonGradientTop"), Color("CreateButtonGradientBottom")]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        ),
                                        lineWidth: 1
                                    )
                                    .opacity(0.6)
                                    
                                
                            )
                            //.blur(radius: 40)
                            
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 0)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        
//                        Spacer()
//                            .frame(height: 10)
                        
                    }
                    
                    
                }
                
                //.padding(0)
                .frame(maxWidth: .infinity, alignment: .bottom)
                .fixedSize(horizontal: false, vertical: true)
                
                
            }
            
            .background(Color("MainBackground"))
            .ignoresSafeArea(.keyboard)
            //MARK: - the outter most layer
            
            
            if (showTaskCreationOverlay){
                    Color.black.opacity(0.4) // Dimming effect
                        .ignoresSafeArea()
                    .transition(.opacity)
                VStack{
                    TaskCreation(viewModel: TaskCreationViewModel(), storageViewModel: myViewModel, showExpanded: false, onComplete: { taskCreated in
                        showTaskCreationOverlay = false
                        if (taskCreated) {
                            viewModel.startToast()
                        }
                    }, onError: {
                        viewModel.errorToast()
                    },onEmptyNameError: {
                        viewModel.nameErrorToast()
                    })
                }

            }
            else if showTaskEditionOverlay {
                
                        Color.black.opacity(0.4) // Dimming effect
                            .ignoresSafeArea()
                            .transition(.opacity)
                    VStack{
                        TaskEdition(viewModel: taskEditionViewModel, storageViewModel: myViewModel, showExpanded: false, onComplete: { taskEdited in
                            showTaskEditionOverlay = false
                            if (taskEdited) {
                                viewModel.editionToast()
                            }
                        }, onError: {
                            viewModel.errorToast()
                        },onEmptyNameError: {
                            viewModel.nameErrorToast()
                        })
                    }
                
            }
            
            if ( viewModel.nameErrorToastVisible) {
                HStack(alignment: .center){
                    
                    Image("error-icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("ToastErrorBody"))
                    
                    Text("Please Enter a Task Name")
                        .font(Font.custom("Helvetica", size: 16))
                        .foregroundColor(Color("ToastErrorBody"))
                }
                .frame(maxHeight: 55)
                .frame(maxWidth: 280)
                .background(Color("ToastErrorBackground"))
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.15), radius: 2, x: 0, y: 2)
                .overlay(
                RoundedRectangle(cornerRadius: 15)
                .inset(by: 0.5)
                .stroke(Color("ToastErrorBody"), lineWidth: 1)

                )
            
            
                .padding(.bottom, 680)
                
           }
            
            if ( viewModel.errorToastVisible) {
            HStack(alignment: .center,spacing:13){
                    
                    Image("error-icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("ToastErrorBody"))
                    
                    Text("Sorry, only 3 tasks allowed per priority. \nPlease remove a task from this category.")
                        .font(Font.custom("Helvetica", size: 16))
                        .foregroundColor(Color("ToastErrorBody"))
                }
                .frame(maxHeight: 70)
                .frame(maxWidth: 362)
                .background(Color("ToastErrorBackground"))
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.15), radius: 2, x: 0, y: 2)
                .overlay(
                RoundedRectangle(cornerRadius: 15)
                .inset(by: 0.5)
                .stroke(Color("ToastErrorBody"), lineWidth: 1)

                )
            
            
                .padding(.bottom, 680)
                
            }
            
        }
    }
}



#Preview {
    ContentView()
}
