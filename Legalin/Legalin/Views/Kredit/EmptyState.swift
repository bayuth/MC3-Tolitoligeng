//
//  EmptyState.swift
//  Legalin
//
//  Created by Achmad Fathullah on 04/08/21.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        VStack{
            Image("EmptyKredit")
                .resizable()
                .frame(width: 280, height: 280, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 24)
            
            Text("Tidak Ada Kredit")
				.foregroundColor(Color("textColor"))
                .font(.headline)
            Text("Tambah kredit baru untuk memulai simulasi kredit")
				.foregroundColor(Color("textColor"))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)
                .font(.subheadline)
            
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}
