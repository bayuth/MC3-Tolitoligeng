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
			VStack {
				NavigationLink(
					destination: KebijakanPrivasiPage(),
					label: {
						ButtonKebijakanPrivasi().foregroundColor(.black)
					})
			}.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 500, alignment: .center)
		}
    }
}

struct PengaturanPage_Previews: PreviewProvider {
    static var previews: some View {
        PengaturanPage()
    }
}
