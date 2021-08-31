//
//  KebijakanPrivasiPage.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 17/08/21.
//

import SwiftUI

struct KebijakanPrivasiPage: View {
	@Environment(\.presentationMode) var presentationMode
	var body: some View {
		VStack {
			PrivacyPolicyWebView(url: "https://legalin117210153.wordpress.com/")
		}
		.navigationBarBackButtonHidden(true)
		.navigationBarTitle(Text("Kebijakan Privasi"), displayMode: .inline)
		.navigationBarItems(trailing: Button(action: {self.presentationMode.wrappedValue.dismiss()
		}, label: {
			Text("Tutup")
				.foregroundColor(.white)
		}))
	}
}

struct KebijakanPrivasiPage_Previews: PreviewProvider {
	static var previews: some View {
		KebijakanPrivasiPage()
	}
}
