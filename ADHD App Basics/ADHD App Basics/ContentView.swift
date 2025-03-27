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
        
        VStack(){
            
//            HStack{
//                Text("Todo list app (rough draft)")
//                    .font(.custom("Avenir-Medium", size: 20))
//                //fun fact: this is how you change fonts.
//                //doing fonts individually like this is kinda hell :/
//                    .padding(.horizontal,4)
//                    .padding(.vertical,8)
//                    
//
//                
//                Spacer()
//                Image(systemName: "checkmark.square")
//                    .foregroundColor(.red)
//                    //.font(.title)
//                    .font(.system(size: 25))
//                
//            }
//            .padding(EdgeInsets(top: 0, leading: 10, bottom:10, trailing: 10))
//            .background(Color.yellow)
//            //Note: why doesn't this go full width? - it did when i used a Spacer()
//            
//            Spacer() // NOTE: without this, everything would appear at middle of screen.
            
            //MARK: you can't style tabs when using TabViews and TabItem(s), so commenting this out:
            
            //        TabView{
            //            //tab1:
            //            Text("Tab 1 page")
            //                .tabItem {
            //                    Text("Tab 1")
            //                        .font(.system(size: 30))
            //                    // why doesn't this change the size of the text?
            //
            //                    Image(systemName: "list.bullet.clipboard")
            //                        .resizable()
            //                        //.font(.system(size: 30)) //this didn't work
            //                        .frame(width: 30, height: 30)
            //                }
            //
            //            //tab2:
            //            Text("Tab 2 page")
            //                .tabItem {
            //                    Text("Tab 2")
            //                    Image(systemName: "plus")
            //                }
            //
            //            //tab3:
            //            Text("Tab 3 page")
            //                .tabItem {
            //                    Text("Tab 3")
            //                    Image(systemName: "person.text.rectangle")
            //                }
            //
            //            //tab4:
            //            Text("Tab 4 page")
            //                .tabItem {
            //                    Text("Tab 4")
            //                    Image(systemName: "face.smiling")
            //                }
            //
            //            //tab5:
            //            Text("Tab 5 page")
            //                .tabItem {
            //                    Text("Tab 5")
            //                    Image(systemName: "eyes")
            //                }
            //
            //
            //            // fun fact: if you have more than 5, it'll move the rests to a "more tab"!
            //            //tab6:
            //            Text("Tab 6 page")
            //                .tabItem {
            //                    Text("Tab 6")
            //                    Image(systemName: "checkmark.square")
            //                }
            //        }
            
            
            
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
            HStack(){
                
                //tab 1
                Button (action: {selectedTab = 1}){
                    VStack{
                        Image("menu-tab-1")

                            .resizable()
                            .scaledToFit()
                            .frame(width: 26, height: 26)
                        
                        Text("Daily Plan")
                            .font(Font.custom("Helvetica", size: 14))
                            .fontWeight(.regular)
                    }
                }
                .frame(maxWidth: .infinity)
                

                
                //tab 2
                Button (action: {selectedTab = 2}){
                    VStack{
                        Image("menu-tab-2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26, height: 26)
                        
                        
                        Text("Task Bank")
                            .font(Font.custom("Helvetica", size: 14))
                            .fontWeight(.regular)

                    }
                }
                .frame(maxWidth: .infinity)
                
      

                
                //tab 3
                Button (action: {selectedTab = 3}){
                    VStack{
                        Image("menu-tab-3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26, height: 26)
                        
                        Text("Settings")
                            .font(Font.custom("Helvetica", size: 14))
                            .fontWeight(.regular)

                    }
                }
                .frame(maxWidth: .infinity)
                

                
                //tab 4
                Button (action: {selectedTab = 4}){
                    VStack{
                        Image("menu-tab-4")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26, height: 26)
                        
                        Text("Create new Task")
                            .font(Font.custom("Helvetica", size: 14))
                            .fontWeight(.regular)

                    }
                }
                .frame(maxWidth: .infinity)
                

                
                
                
            }
            .padding(.horizontal, 20)
            .accentColor(Color.init(red: 121/255, green: 68/255, blue: 5/255))
            .background(Color.yellow)
        }.ignoresSafeArea(.keyboard)
        //MARK: - App's header title?
        
        
        
        
        
    }
}



#Preview {
    ContentView()
}
