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
	@State var isDisable:Bool
	
    var body: some View {
		
		if isDisable{
			VStack(alignment: .leading) {
				
				Text(title).font(.footnote).fontWeight(.regular).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
				TextField(title, text: $profileValue).font(.headline).foregroundColor(Color(#colorLiteral(red: 0.6470588235, green: 0.6470588235, blue: 0.6470588235, alpha: 1))).keyboardType(keyboardNum ? .numberPad : .default).disabled(isDisable)
				Divider()
				
			}.padding(.bottom)
		} else {
			VStack(alignment: .leading) {
				
				Text(title).font(.footnote).fontWeight(.regular).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
				TextField(title, text: $profileValue).font(.body).keyboardType(keyboardNum ? .numberPad : .default).disabled(isDisable)
				Divider()
				
			}.padding(.bottom)
		}
    }
}

//struct FormView_Previews: PreviewProvider {
////    static var previews: some View {
////		@State var lempar:Binding<String>
////		FormView(title: "Nomor Telepon", profileValue: Binding<Any>, keyboardNum: true)
////
////    }
//}
