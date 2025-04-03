//
//  TodaysPage.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-04-03.
//

import SwiftUI

struct TodaysPage: View {
    
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
                        Text("Monday, December 20")
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
                            
                            Text("Move Tasks")
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
                    
                    VStack(alignment: .center, spacing: 18) {
                        
                    }
                    .padding(0)
                    .frame(width: 402, alignment: .top)
                }
                
                
                
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("MainBackground"))
           
            
        }
        
       
    }
}

#Preview {
    TodaysPage()
}
