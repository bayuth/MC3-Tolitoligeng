//
//  PengaturanPage.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 17/08/21.
//

import SwiftUI

struct PengaturanPage: View {
    var body: some View {
		NavigationView {
			VStack(alignment: .leading) {
				NavigationLink(
					destination: KebijakanPrivasiPage(),
					label: {
						ButtonKebijakanPrivasi().foregroundColor(.black)
					})
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
		}
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct PengaturanPage_Previews: PreviewProvider {
    static var previews: some View {
        PengaturanPage()
    }
}
