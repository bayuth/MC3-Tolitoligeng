//
//  MultiLineFormView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 23/08/21.
//

import SwiftUI

struct MultiLineFormView: View {
	@Binding var alamat:String
    var body: some View {
		VStack(alignment: .leading) {
			Text("Alamat").font(.footnote).fontWeight(.regular).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
				.padding(.horizontal)
			if alamat == "" {
				TextEditor(text: .constant("Alamat")).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
					.border(Color.black)
					.padding(.horizontal)
					.onTapGesture {
						TextEditingCommands.self
					}
			} else {
				TextEditor(text: $alamat).frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
					.font(.body)
					.border(Color.black)
					.padding(.horizontal)
			}
		}
		.padding(.bottom)
	}
}

struct MultiLineFormView_Previews: PreviewProvider {
    static var previews: some View {
		MultiLineFormView(alamat: .constant("Testing alamat yang panjang sepanjang cintaku padamu"))
    }
}
