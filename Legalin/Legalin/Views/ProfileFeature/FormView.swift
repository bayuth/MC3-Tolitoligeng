//
//  FormView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 04/08/21.
//

import SwiftUI

struct FormView: View {
	
	var title = ""
	@State var profileValue = ""
	
    var body: some View {
		
		VStack(alignment: .leading) {
			if title.contains("NIK") {
				Text(title).font(.footnote).fontWeight(.light)
				TextField(title, text: $profileValue).keyboardType(.numberPad)
				Divider()
			}
			else if title.contains("RT") {
				Text(title).font(.footnote).fontWeight(.light)
				TextField(title, text: $profileValue).keyboardType(.numberPad)
				Divider()
			}
			else if title.contains("RW") {
				Text(title).font(.footnote).fontWeight(.light)
				TextField(title, text: $profileValue).keyboardType(.numberPad)
				Divider()
			}
			else if title.contains("Nomor Telepon") {
				Text(title).font(.footnote).fontWeight(.light)
				TextField(title, text: $profileValue).keyboardType(.numberPad)
				Divider()
			}
			else {
				Text(title).font(.footnote).fontWeight(.light)
				TextField(title, text: $profileValue)
				Divider()
			}
			
		}.padding(.bottom)
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
		FormView(title: "Nomor Telepon", profileValue: "bosq")
		
    }
}
