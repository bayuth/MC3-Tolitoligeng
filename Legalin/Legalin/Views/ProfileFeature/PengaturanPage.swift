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
		NavigationView {
			VStack(alignment: .leading) {
				NavigationLink(
					destination: KebijakanPrivasiPage(),
					label: {
						ButtonKebijakanPrivasi().foregroundColor(.black)
					})
			}
//			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
			.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
		}
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
