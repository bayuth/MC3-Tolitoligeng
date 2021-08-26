//
//  ButtonKebijakanPrivasi.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 17/08/21.
//

import SwiftUI

struct ButtonKebijakanPrivasi: View {
	
	@Environment(\.presentationMode) var kebijakanmode: Binding<PresentationMode>
	
    var body: some View {
		VStack {
			ZStack(alignment: .leading) {
				RoundedRectangle(cornerRadius: 10)
					.frame(width: UIScreen.main.bounds.width - 35, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
					.foregroundColor(Color("cardColor"))
				HStack {
					Text("Kebijakan Privasi")
						.foregroundColor(Color("textColor"))
						Spacer()
					Image(systemName: "chevron.right")
						.foregroundColor(Color("textColor"))
						.padding(.leading)
				}
				.frame(width: UIScreen.main.bounds.width - 50, height: 55, alignment: .leading)
			}.clipped()
		}
		
    }
}

struct ButtonKebijakanPrivasi_Previews: PreviewProvider {
    static var previews: some View {
        ButtonKebijakanPrivasi()
    }
}
