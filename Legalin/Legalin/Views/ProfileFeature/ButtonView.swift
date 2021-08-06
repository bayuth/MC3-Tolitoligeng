//
//  ButtonView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 04/08/21.
//

import SwiftUI

struct ButtonView: View {
	
	@State var showView = false
	
    var body: some View {
		VStack(alignment: .leading) {
			Text("KTP")
			Button(action: {
				self.showView = true
			}, label: {
				Text("Ambil gambar KTP untuk isi otomatis \(Image(systemName: "camera.fill"))").foregroundColor(Color(#colorLiteral(red: 0, green: 0.2837583721, blue: 0.423648268, alpha: 1)))
			})
		}
		
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(showView: false)
    }
}
