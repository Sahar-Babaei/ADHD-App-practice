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

                    }
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

#Preview {
    SettingsPage()
}
