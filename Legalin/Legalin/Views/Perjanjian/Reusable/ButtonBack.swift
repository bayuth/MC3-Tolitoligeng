//
//  ButtonBack.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 07/08/21.
//

import SwiftUI

struct ButtonBack: View {
	
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	
    var body: some View {
		Button(action: {
			self.presentationMode.wrappedValue.dismiss()
		}, label: {
			HStack{
				Image(systemName: "chevron.backward").aspectRatio(contentMode: .fill)
				Text("Kembali")
			}
		})
    }
}

struct ButtonBack_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBack()
    }
}
