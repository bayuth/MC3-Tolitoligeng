//
//  ButtonPilihIdentitas.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 10/08/21.
//

import SwiftUI

struct ButtonBordered: View {
    @State private var showAlert = false
    @State var icon :String
    @State var titleButton :String
    var action :() -> Void
    let titleAlert = "Akan Hadir!"
    let subTitleAlert = "Masih dalam pengerjaan."
    var body: some View {
        Button(action: action) {
            Text("\(Image(systemName: icon)) \(titleButton)").font(.subheadline)
                .padding(6)
                .cornerRadius(5)
                .foregroundColor(Color.init(hex: "104769"))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.init(hex: "104769"), lineWidth: 1)
                )
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text(titleAlert), message: Text(subTitleAlert), dismissButton: .destructive(Text("Close").fontWeight(.black)))
        }).padding(.bottom,13)
    }
}
