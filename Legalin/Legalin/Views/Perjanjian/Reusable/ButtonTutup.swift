//
//  ButtonTutup.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 09/08/21.
//

import SwiftUI

struct ButtonTutup: View {
	@State var showPerjanjianPage = false
	
    var body: some View {
		Button(action: {
			self.fullScreenCover(isPresented: $showPerjanjianPage, content: {
//				PerjanjianPage()
			})
		}, label: {
			Text("Tutup")
		})
		
    }
}

struct ButtonTutup_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTutup()
    }
}
