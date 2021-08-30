//
//  CustomTextEditor.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 25/08/21.
//

import SwiftUI

struct textEditorPlaceholder: View {
	@State var text:String
	var body: some View {
		TextEditor(text: $text)
			.font(.custom("Helvetica", size: 24))
			.padding(.all)
			.background(Color(.red))
			.frame(minHeight: 50, maxHeight: 50)
	}
}

struct CustomTextEditor: View {
	
	@Binding var text:String
	@Binding var isDisable:Bool
	@State var placeHolder = "Alamat"
	@ObservedObject var perjanjianController: PerjanjianController = .shared
	
	init(textData:Binding<String>, isDisableAddress:Binding<Bool>) {
			 UITextView.appearance().backgroundColor = .clear
		_text = textData
		_isDisable = isDisableAddress
		 }
	
	var body: some View {
		if isDisable {
			VStack(alignment: .leading) {
				Text("Alamat").font(.footnote).fontWeight(.regular).foregroundColor(Color("labelColor"))
				ZStack(alignment: .topLeading) {
					if text.isEmpty {
						Text("Alamat Sesuai KTP")
							.foregroundColor(Color("labelColor"))
							.padding(.horizontal, 8)
							.padding(.vertical, 12)
					}
					TextEditor(text: $text)
						.disabled(isDisable)
						.foregroundColor(Color("labelColor"))
						.accentColor(Color("tabBarColor"))
						.font(.body)
				}
				.foregroundColor(.blue)
	//			.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 50)
				Divider()
			}
			.frame(maxWidth: UIScreen.main.bounds.width, minHeight: 100)
			.padding(.bottom)
			.padding(.horizontal)
		} else {
			VStack(alignment: .leading) {
				Text("Alamat").font(.footnote).fontWeight(.regular).foregroundColor(Color("labelColor"))
				ZStack(alignment: .topLeading) {
					if text.isEmpty {
						Text("Alamat Sesuai KTP")
							.foregroundColor(Color("labelColor"))
							.fontWeight(.regular)
							.padding(.horizontal, 8)
							.padding(.vertical, 12)
					}
					TextEditor(text: $text)
						.disabled(isDisable)
						.foregroundColor(Color("textColor"))
						.accentColor(Color("tabBarColor"))
						.font(.body)
						.background(Color("emptyAlertColor").opacity(getRedIndicator() ? 0.15 : 0.0))
				}
				.foregroundColor(.blue)
	//			.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 50)
				Divider()
			}
			.frame(maxWidth: UIScreen.main.bounds.width, minHeight: 100, maxHeight: 120)
			.padding(.bottom)
			.padding(.horizontal)
		}
	}
	
	func getRedIndicator() -> Bool{
		if ((text == "") && (perjanjianController.endButtonPressed == true)){
			return true
		} else {
			return false
		}
	}
	
}

//struct CustomTextEditor_Previews: PreviewProvider {
//	static var previews: some View {
//		CustomTextEditor(text: .constant(""))
//	}
//}
