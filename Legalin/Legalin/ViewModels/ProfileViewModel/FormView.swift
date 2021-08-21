//
//  FormView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 04/08/21.
//

import SwiftUI
import UIKit

struct FormView: View {
	
	@State var title:String
	@Binding var profileValue:String
	@State var keyboardNum:Bool
	@Binding var isDisable:Bool
//    @Binding var editedValue = 
//    @State var containerHeight: CGFloat = 0
	
    var body: some View {
		
		if isDisable{
			VStack(alignment: .leading) {
				
				Text(title).font(.footnote).fontWeight(.regular).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
                TextField(title, text: $profileValue)
                    .font(.body)
                    .keyboardType(keyboardNum ? .numberPad : .default)
                    .disabled(isDisable)
//                DoneKeyboard(text: $profileValue, hint: title, keyType: keyboardNum ? UIKeyboardType.numberPad : UIKeyboardType.default)
//                    .font(.body)
//                    .disabled(isDisable)
//                    .frame(maxWidth: .infinity, maxHeight: 20)
				Divider()
				
			}.padding(.bottom)
		} else {
			VStack(alignment: .leading) {
				
				Text(title).font(.footnote).fontWeight(.regular).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
//                DoneKeyboard(text: $profileValue, hint: title, keyType: keyboardNum ? UIKeyboardType.numberPad : UIKeyboardType.default)
//                    .font(.body)
//                    .disabled(isDisable)
//                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 20)
                TextField(title, text: $profileValue)
                    .font(.body)
                    .keyboardType(keyboardNum ? .numberPad : .default)
                    .disabled(isDisable)
				Divider()
				
			}
            .padding(.bottom)
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
