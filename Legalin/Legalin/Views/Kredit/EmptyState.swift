//
//  EmptyState.swift
//  Legalin
//
//  Created by Achmad Fathullah on 04/08/21.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        NavigationView{
            VStack{
                Image("EmptyKredit")
                    .resizable()
                    .frame(width: 280, height: 280, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 24)
                
                Text("Tidak Ada Kredit")
                    .foregroundColor(Color(hex: "#707070"))
                    .font(.headline)
                Text("Tambah kredit baru untuk memulai simulasi kredit")
                    .foregroundColor(Color(hex: "#707070"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .font(.subheadline)
                
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

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}
