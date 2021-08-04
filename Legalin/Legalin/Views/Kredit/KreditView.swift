//
//  KreditView.swift
//  Legalin
//
//  Created by Achmad Fathullah on 02/08/21.
//

import SwiftUI

struct KreditView: View {
    var bayu = 0
    
    var body: some View {
        NavigationView{
            VStack{
                if bayu == 0 {
                    EmptyState()
                }else{
                    Text("yoo")
                }
            }
            .navigationTitle("Kredit")
            .navigationBarItems(trailing:
                Button(action: {
                    print("User icon pressed...")
                }) {
                    Image(systemName: "plus").imageScale(.large)
                        .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                }
            )
        }
        
    }
}

struct KreditView_Previews: PreviewProvider {
    static var previews: some View {
        KreditView()
    }
}
