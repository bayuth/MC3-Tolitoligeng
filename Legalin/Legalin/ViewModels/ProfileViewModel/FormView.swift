//
//  FormView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 04/08/21.
//

import SwiftUI
import UIKit

struct FormView: View {
	
	@Environment (\.colorScheme) var colorScheme
	@State var title:String
	@Binding var profileValue:String
	@State var keyboardNum:Bool
	@Binding var isDisable:Bool
    @ObservedObject var perjanjianController: PerjanjianController = .shared
	
    var body: some View {
		
		if isDisable{
			VStack(alignment: .leading) {
				
				Text(title).font(.footnote).fontWeight(.regular).foregroundColor(Color("labelColor")).padding(.horizontal)
                VStack{
                    TextField(title, text: $profileValue)
                        .font(.body)
                        .foregroundColor(Color("labelColor"))
                        .padding(.horizontal)
					.lineLimit(3)
                    
                    Divider()
                }.background(Color("emptyAlertColor").opacity(getRedIndicator() ? 0.15 : 0.0))
				
			}.padding(.bottom)
            
		} else {
			VStack(alignment: .leading) {
				
                Text(title).font(.footnote).fontWeight(.regular).foregroundColor(Color("labelColor")).padding(.horizontal)
//				TextField(title, text: $profileValue).font(.body).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))).padding(.horizontal)
                VStack{
                DoneKeyboard(text: $profileValue, hint: title, keyType: keyboardNum ? UIKeyboardType.numberPad : UIKeyboardType.default)
					.foregroundColor(Color("formViewColor"))
					.lineLimit(3)
					.accentColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                    .font(.body)
                    .disabled(isDisable)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 20)
                    .padding(.horizontal)
                     Divider()
                    
                }.background(Color("emptyAlertColor").opacity(getRedIndicator() ? 0.15 : 0.0))
				
			}
            .padding(.bottom)
		}
    }
    func getRedIndicator() -> Bool{
        if ((profileValue == "") && (perjanjianController.endButtonPressed == true)){
            return true
        } else {
            return false
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
