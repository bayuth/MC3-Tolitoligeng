//
//  ModalEmpty.swift
//  Legalin
//
//  Created by Achmad Fathullah on 24/08/21.
//

import SwiftUI

struct ModalEmpty: View {
    @State var conditionMessage: String
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Text(conditionMessage)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Text("Batalkan").foregroundColor(.white)
                    }
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Pilih Kredit", displayMode: .inline)
            .accentColor(.red)
            .navigationBarBackButtonHidden(true)
    }
}
