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
	@State var placeHolder = "Alamat"
	
	init(textData:Binding<String>) {
			 UITextView.appearance().backgroundColor = .clear
		_text = textData
		 }
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("Alamat").font(.footnote).fontWeight(.regular).foregroundColor(Color("labelColor"))
			ZStack(alignment: .topLeading) {
				if text.isEmpty {
					Text("Alamat Sesuai KTP")
						.foregroundColor(Color(UIColor.placeholderText))
						.padding(.horizontal, 8)
						.padding(.vertical, 12)
				}
				TextEditor(text: $text)
					.foregroundColor(Color("textColor"))
					.accentColor(Color("tabBarColor"))
					.font(.body)
			}
//			VStack {
				
//				TextEditor(text: $text)
//					.background(Color(.blue))
//					.padding(.horizontal, -5)
//					.font(.body)
//					.foregroundColor(text == placeHolder ? Color("labelColor") : .primary)
//					.onAppear(perform: {
//						if text == "" {
//							text = placeHolder
//						}
//						else {
//							text = text
//						}
//						NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notif in
//							if text == "" {
//								text = placeHolder
//							}
//							else if text == placeHolder {
//								text = ""
//							}
//
//						}
//						NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { notif in
//							if text == "" {
//								text = placeHolder
//							}
//						}
//
//					})
					
//					.onTapGesture {
//						if text == placeHolder {
//							text = ""
//						}
////						else if text == "" {
////							text = placeHolder
////						}
////						else {
////							text = text
////						}
//					}
					
//					.onChange(of: text, perform: { value in
//						if text == "" {
//							text = placeHolder
//						}
//					})
//			}
			.foregroundColor(.blue)
//			.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 50)
			Divider()
		}
		.frame(maxWidth: UIScreen.main.bounds.width)
		.padding(.bottom)
		.padding(.horizontal)
	}
}

//struct CustomTextEditor_Previews: PreviewProvider {
//	static var previews: some View {
//		CustomTextEditor(text: .constant(""))
//	}
//}
