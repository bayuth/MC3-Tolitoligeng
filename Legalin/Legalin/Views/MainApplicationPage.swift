//
//  MainApplicationPage.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI

struct MainApplicationPage: View {
    @AppStorage("shouldShowOnBoarding") var shouldShowOnBoarding: Bool = true
    @AppStorage("selection") var selection = 3
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("tabBarColor"))
        UITabBar.appearance().barTintColor = UIColor(Color("tabBarColor"))
		UITabBar.appearance().selectedItem?.badgeColor = UIColor(Color("labelColor"))
		UITabBar.appearance().unselectedItemTintColor = UIColor(Color("tabBarUnselected"))
        UITabBar.appearance().isTranslucent = true
    }

    var body: some View {
        ZStack{
            TabView(selection: $selection){
                MainPerjanjianPage()
                    .tabItem {
                        Text("Perjanjian")
                            .foregroundColor(.white)
                        Image("perjanjian")
                    }
                    .tag(1)
                KreditView()
                    .tabItem {
                        Text("Kredit")
                            .foregroundColor(.white)
                        Image("kredit")
                        
                    }
                    .tag(2)
                ProfileView()
                    .tabItem {
                        Text("Profile")
                            .foregroundColor(.white)
                        Image("profile")
                    }
                    .tag(3)
            }
            
            .accentColor(Color("tabBarSelectedColor"))
            DisclaimerPopUp(shouldShowOnBoarding: $shouldShowOnBoarding, selection: $selection)
        }
        
    }
}


struct MainApplicationPage_Previews: PreviewProvider {
    static var previews: some View {
        MainApplicationPage()
            
    }
}
