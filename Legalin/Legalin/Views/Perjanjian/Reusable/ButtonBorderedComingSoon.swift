//
//  ButtonBorderedComingSoon.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 11/08/21.
//

import SwiftUI

struct ButtonBorderedComingSoon: View {
	@State private var showAlert = false
	@State var icon :String
	@State var titleButton :String
	let titleAlert = "Kambing Soon!"
	let subTitleAlert = "Fitur ini masih dalam proses development. maafkan developer kami yang kerjanya lambat :)"
	var body: some View {
		Button(action: {
			self.showAlert = true
		}, label: {
			Text("\(Image(systemName: icon)) \(titleButton)").font(.subheadline).padding(6).border(Color(#colorLiteral(red: 0, green: 0.2837583721, blue: 0.423648268, alpha: 1))).cornerRadius(5).foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
		}).alert(isPresented: $showAlert, content: {
			Alert(title: Text(titleAlert), message: Text(subTitleAlert), dismissButton: .destructive(Text("Close").fontWeight(.black)))
		}).padding(.bottom,13)
	}
}

struct ButtonBorderedComingSoon_Previews: PreviewProvider {
    static var previews: some View {
		ButtonBorderedComingSoon(icon: "person.fill", titleButton: "Pilih Identitas")
    }
}
