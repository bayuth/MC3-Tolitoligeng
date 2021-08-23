//
//  PrivacyPolicyView.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 20/08/21.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            PrivacyPolicyWebView(url: "https://legalin117210153.wordpress.com/")
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle(Text("Kebijakan Privasi"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Tutup")
                        .foregroundColor(.white)
                }))
        }
    }
    
    
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
