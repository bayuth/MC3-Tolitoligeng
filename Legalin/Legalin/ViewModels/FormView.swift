//
//  FormView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 04/08/21.
//

import SwiftUI

struct FormView: View {
	
	@State var title:String
	@Binding var profileValue:String
	@State var keyboardNum:Bool
	
    var body: some View {
		
		VStack(alignment: .leading) {
			
			Text(title).font(.footnote).fontWeight(.light)
			TextField(title, text: $profileValue).font(.body).keyboardType(keyboardNum ? .numberPad : .default)
			Divider()
			
		}.padding(.bottom)
    }
}

//struct FormView_Previews: PreviewProvider {
////    static var previews: some View {
////		@State var lempar:Binding<String>
////		FormView(title: "Nomor Telepon", profileValue: Binding<Any>, keyboardNum: true)
////
////    }
//}