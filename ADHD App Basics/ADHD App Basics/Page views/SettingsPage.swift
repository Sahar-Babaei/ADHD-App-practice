//
//  SettingsPage.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-04-11.
//

import SwiftUI

//struct SettingsPage: View {
//    var body: some View {
//        NavigationView{
//            ZStack{
//                VStack{
//                    
//                    //heading
//                    HStack(alignment:.bottom){
//                        //name + date
//                        VStack(alignment:.leading, spacing:5){
//                            
//                            //page title
//                            Text("Settings")
//                                .font(Font.custom("Helvetica", size: 26))
//                                .fontWeight(.bold)
//                                .foregroundColor(Color("BodyCopy"))
//                            
//                            
//                        }
//                        Spacer()
//                    }
//                    .padding(.horizontal, 12)
//                    .padding(.top, 10)
//                    .padding(.bottom, 8)
//                    
// 
//                        ScrollView{
//                            VStack(){
////                                Spacer()
////                                    .frame(height:120)
//                                
//                                VStack {
//                                    Text("Setting and Preference features will be added soon!")
//                                        .font(Font.custom("Helvetica", size: 16))
//                                        .foregroundColor(Color("BodyCopy"))
//                                        .fontWeight(.regular)
//                                        .padding()
//                                        //.background(.blue)
//                                        .multilineTextAlignment(.center)
//                                        .frame(maxWidth: .infinity, alignment: .center)
//                                }
//                                .padding(.top,15)
//
////                                Spacer()
////                                    .frame(height:250)
//                                
//                                VStack{
//                                    Image("SaharKirsten")
//                                        .resizable()
//                                        .scaledToFit()
//                                        //.frame(width: 30, height: 30)
//                                        .padding(.horizontal,50)
//                                    
//                                    Text("Designed & Developed by Sahar and Kirsten")
//                                        .foregroundColor(Color("BodyCopy"))
//                                        .font(Font.custom("Helvetica", size: 13))
//                                        .fontWeight(.regular)
//                                        .padding()
//                                        
//                                }
//                                .padding(.top,270)
//                                
//
//                            }
//                           
//                        }
//                        .frame(maxWidth: .infinity, alignment: .center)
//                        
//                        .background(Color("MainForeground"))
//                        .cornerRadius(15)
//                        
//                        .padding(.horizontal)
//                        .padding(.bottom,95)
//                        
//                        
//                       // .background(.red)
//
//
//                }
//               
//            }
//            .frame(maxWidth: .infinity, alignment: .center)
//            .background(Color("MainBackground"))
//        }
//        
//    }
//}


struct SettingsPage: View {
    @AppStorage("selectedAppearance") private var selectedAppearance: AppearanceOption = .system

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")) {
                    Picker("Appearance", selection: $selectedAppearance) {
                        ForEach(AppearanceOption.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                // Your existing settings content
            }
            .navigationTitle("Settings")
        }
    }
}


#Preview {
    SettingsPage()
}


