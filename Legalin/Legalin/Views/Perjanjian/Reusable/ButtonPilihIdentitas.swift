//
//  ButtonPilihIdentitas.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 10/08/21.
//

import SwiftUI

struct ButtonPilihIdentitas: View {
	@State private var showAlert = false
	
    var body: some View {
		Button(action: {
			self.showAlert = true
		}, label: {
			Text("\(Image(systemName: "person.fill")) Pilih Identitas (Opsional)").font(.subheadline).padding(6).border(Color(#colorLiteral(red: 0, green: 0.2837583721, blue: 0.423648268, alpha: 1))).cornerRadius(5).foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
		}).alert(isPresented: $showAlert, content: {
			Alert(title: Text("Kambing Soon!"), message: Text("Fitur ini masih dalam tahap development, maafkan developer kami yang kerjanya lambat :)"), dismissButton: .destructive(Text("Tutup").fontWeight(.black)))
		}).padding(.bottom,13)
    }
}

struct ButtonPilihIdentitas_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPilihIdentitas()
    }
}
