//
//  SettingsPage.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-04-11.
//

import SwiftUI

struct SettingsPage: View {
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    
                    //heading
                    HStack(alignment:.bottom){
                        //name + date
                        VStack(alignment:.leading, spacing:5){
                            
                            //page title
                            Text("Settings")
                                .font(Font.custom("Helvetica", size: 26))
                                .fontWeight(.bold)
                                .foregroundColor(Color("BodyCopy"))
                            
                            
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 12)
                    .padding(.top, 10)
                    .padding(.bottom, 8)
                    
 
                        ScrollView{
                            VStack(){
//                                Spacer()
//                                    .frame(height:120)
                                
                                HStack{
                                    Text("Settings and Preferences")
                                        .font(Font.custom("Helvetica", size: 15))
                                        .fontWeight(.regular)
                                        .padding()
                                        .background(.blue)
                                }

                                
                                HStack{
                                    Text("Settings and Preferences")
                                        .font(Font.custom("Helvetica", size: 15))
                                        .fontWeight(.regular)
                                        .padding()
                                        .background(.green)
                                }
                                
                                VStack{
                                    Image("SaharKirsten")
                                        .resizable()
                                        .scaledToFit()
                                        //.frame(width: 30, height: 30)
                                        .padding(.horizontal,50)
                                    
                                    Text("Designed & Developed by Sahar and Kirsten")
                                        .foregroundColor(Color("BodyCopy"))
                                        .font(Font.custom("Helvetica", size: 15))
                                        .fontWeight(.regular)
                                        .padding()
                                        
                                }
                                

                            }
                           
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        .background(Color("MainForeground"))
                        .cornerRadius(15)
                        
                        .padding()
                        .padding(.bottom,74)
                        
                        
                        .background(.red)


                }
               
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("MainBackground"))
        }
        
    }
}

#Preview {
    SettingsPage()
}


