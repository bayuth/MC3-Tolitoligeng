//
//  MainApplicationPage.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI

struct MainApplicationPage: View {
    @AppStorage("shouldShowOnBoarding") var shouldShowOnBoarding: Bool = true
    @State var selection1 = 1
    @State var selection3 = 3
    
    init(){
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)
        UITabBar.appearance().isTranslucent = true
    }
    

    var body: some View {
        ZStack{
            TabView(selection: $selection3){
                PerjanjianPage()
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
            .accentColor(.white)
            DisclaimerPopUp(shouldShowOnBoarding: $shouldShowOnBoarding)
        }
        
    }
}

//func defaultTab(select:Int)->Int{
//    if shouldShowOnBoarding{
//        selection = 3
//    }
//    else{
//        selection = 1
//    }
//    return selection
//}

struct MainApplicationPage_Previews: PreviewProvider {
    static var previews: some View {
        MainApplicationPage()
            
    }
}
