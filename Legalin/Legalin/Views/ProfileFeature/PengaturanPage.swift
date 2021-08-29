//
//  PengaturanPage.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 17/08/21.
//

import SwiftUI

struct PengaturanPage: View {
	
	@Environment(\.presentationMode) var pengaturanMode: Binding<PresentationMode>
	
	var body: some View {
			VStack() {
				NavigationLink(
					destination: KebijakanPrivasiPage(),
					label: {
						ButtonKebijakanPrivasi().foregroundColor(.black)
					})
					.padding(.vertical)
				Spacer()
			}
//			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
		.navigationBarTitleDisplayMode(.inline)
		.navigationBarBackButtonHidden(true)
		.navigationBarTitle("Pengaturan")
		.navigationBarItems(trailing:
								Button(action: {
									pengaturanMode.wrappedValue.dismiss()
								}, label: {
									Text("Tutup")
										.foregroundColor(.white)
								})
		)
	}
}

struct PengaturanPage_Previews: PreviewProvider {
	static var previews: some View {
		PengaturanPage()
	}
}
