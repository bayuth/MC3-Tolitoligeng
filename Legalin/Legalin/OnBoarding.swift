//
//  OnBoarding.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 20/08/21.
//

import SwiftUI

struct OnBoarding: View {
    var body: some View {
        VStack{
            Spacer()
//            DisclaimerPopUp()
        }
        .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4)))
        .edgesIgnoringSafeArea(.top)
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
