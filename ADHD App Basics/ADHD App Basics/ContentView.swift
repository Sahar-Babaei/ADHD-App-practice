//
//  ContentView.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-02-14.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 1
    // variable for changing tabs
    
    //navigation path:
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            
            
            
            
            //MARK: - Content for each tab's page
            VStack{
                
                switch selectedTab{
                case 1:
                    //make enums for name of each tab instead of 1,2,3,...
                    Text ("this is tab 1 lol")
                case 2:
                    //Text ("this is tab 2 lol lol ")
                    TaskBankPage(potato: TaskBankViewModel())
                case 3:
                    Text ("this is tab 3 lol lol lol")
                case 4:
                    Text ("this is tab 4 lol lol lol lol")
                case 5:
                    Text ("this is tab 5 lol lol lol lol lol")
                default: //if we do an enum, the default is not necessary. only for ints
                    Text ("this tab doesn't exist")
                    //TODO: Mentor? is using switch a good idea? the default case seems pointless...
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            //TODO: somehow this verically centers the text but i don't know why it doesn't automatically happen.
            
            
            
            //MARK: - the tabs
            ZStack(alignment: .leading){
                
                
                
                //--> HStack for 3 tabs
                VStack(){
                    
                    Spacer()
                        .frame(height:80)
                    HStack(alignment: .center, spacing: 51){
                        
                        //tab 1
                        Button (action: {selectedTab = 1}){
                            VStack{
                                Image("menu-tab-1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(Color("BodyCopy"))
                            }
                        }
                        
                        
                        
                        
                        //tab 2
                        Button (action: {selectedTab = 2}){
                            VStack{
                                Image("menu-tab-2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(Color("BodyCopy"))
                            }
                        }
                        
                        
                        
                        
                        
                        //tab 3
                        Button (action: {selectedTab = 3}){
                            VStack{
                                Image("menu-tab-3")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(Color("BodyCopy"))
                                
                            }
                        }
                        
                        
                    }
                    //.background(Color.yellow)
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                    .padding(.bottom, 40)
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
                    .background(Color("MenuBackground"))
                    .background(.ultraThinMaterial)
                    
                    //.blur(radius: 40)
                    //.blur(radius: 2, opaque: false)
                    //.background(.thinMaterial)
                    //.background(.ultraThinMaterial)
                    
                    //.frame(alignment: .bottom)
                    
                }
                //.background(Color.blue)
                
                
                // --> HStack all of this is for the plus (+) button section
                VStack{
                //Spacer()
                
                HStack(alignment: .center, spacing: 10){
                    HStack(alignment: .center, spacing: 10){
                        
                        //tab 4
                        Button (action: {selectedTab = 4}){
                            VStack{
                                Image("menu-tab-4")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(Color("BodyCopy"))
                                
                            }
                        }
                    }
                    .padding(30)
                    .background(Color(red: 0.54, green: 0.54, blue: 0.54).opacity(0.3))
                    .background(.ultraThinMaterial) //Delete this if it doesn't make it transparent
                    
                    .cornerRadius(57)
                    .overlay(
                        RoundedRectangle(cornerRadius: 57)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.4, green: 0.4, blue: 0.4), lineWidth: 1)
                        
                    )
                    //.blur(radius: 40)
                    
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 0)
                .frame(maxWidth: .infinity, alignment: .trailing)

                
                    Spacer()
                        .frame(height: 10)
                    
                }
                
                
            }
            
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .bottom)
            .fixedSize(horizontal: false, vertical: true)

        }
        
        .background(Color("MainBackground"))
        .ignoresSafeArea(.keyboard)
        //MARK: - App's header title?
            
        
        
        
        
    }
}



#Preview {
    ContentView()
}
