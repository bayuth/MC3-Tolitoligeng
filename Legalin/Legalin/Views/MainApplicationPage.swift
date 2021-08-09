//
//  MainApplicationPage.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI

struct MainApplicationPage: View {
    init(){
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)
        UITabBar.appearance().isTranslucent = true
    }
    var body: some View {
        TabView{
            
            PerjanjianPage()
                .tabItem {
                    Text("Perjanjian")
                        .foregroundColor(.white)
                    Image("perjanjian")
                    
                }
            KreditView()
                .tabItem {
                    Text("Kredit")
                        .foregroundColor(.white)
                    Image("kredit")
                    
                }
            ProfileView()
                .tabItem {
                    Text("Profile")
                        .foregroundColor(.white)
                    Image("profile")
                }
        }
        .accentColor(.white)
    }
}

 

struct MainApplicationPage_Previews: PreviewProvider {
    static var previews: some View {
        MainApplicationPage()
            
    }
}
