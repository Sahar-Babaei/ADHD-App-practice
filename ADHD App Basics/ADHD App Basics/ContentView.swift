//
//  ContentView.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-02-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            
            Text("Todo list app (rough draft)")
                .font(.custom("Avenir-Medium", size: 17))
            //fun fact: this is how you change fonts.
            //doing fonts individually like this is kinda hell :/
                
            // TODO: mentor? how do i define font styles so i can apply them all over the project? (all heading 1s should be avenir bold 25, all body should be Helverica light 16, etc)
            
            Spacer()
            //TODO: ^ not sure how this works but i had to put it in the middle of the two elements.
            Image(systemName: "checkmark.square")
                .foregroundColor(.red)
                           .font(.title)
            
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom:10, trailing: 10))
        .background(Color.yellow)
        //TODO: why doesn't this go full width?

        
        TabView{
            //tab1:
            Text("Tab 1 page")
                .tabItem {
                    Text("Tab 1")
                    Image(systemName: "list.bullet.clipboard")
                }
            
            //tab2:
            Text("Tab 2 page")
                .tabItem {
                    Text("Tab 2")
                    Image(systemName: "plus")
                }
            
            //tab3:
            Text("Tab 3 page")
                .tabItem {
                    Text("Tab 3")
                    Image(systemName: "person.text.rectangle")
                }
            
            //tab4:
            Text("Tab 4 page")
                .tabItem {
                    Text("Tab 4")
                    Image(systemName: "face.smiling")
                }
            
            //tab5:
            Text("Tab 5 page")
                .tabItem {
                    Text("Tab 5")
                    Image(systemName: "eyes")
                }
            
            
            // fun fact: if you have more than 5, it'll move the rests to a "more tab"!
            //tab6:
            Text("Tab 6 page")
                .tabItem {
                    Text("Tab 6")
                    Image(systemName: "checkmark.square")
                }
        }
        

        .padding()
    }
}



#Preview {
    ContentView()
}
