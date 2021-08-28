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
	var body: some View {
		VStack(alignment: .leading) {
			Text("Alamat").font(.footnote).fontWeight(.regular).foregroundColor(Color("labelColor"))
			VStack {
				TextEditor(text: $text)
					.background(Color(.blue))
					.padding(.horizontal, -5)
					.font(.body)
					.foregroundColor(text == placeHolder ? Color("labelColor") : .primary)
					.onAppear(perform: {
						if text == "" {
							text = placeHolder
						}
						else {
							text = text
						}
					})
					.onTapGesture {
						if text == placeHolder {
							text = ""
						}
						else if text == "" {
							text = placeHolder
						}
						else {
							text = text
						}
					}
					
//					.onChange(of: text, perform: { value in
//						if text == "" {
//							text = placeHolder
//						}
//					})
			}
			.foregroundColor(.blue)
//			.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 50)
			Divider()
		}
		.frame(maxWidth: UIScreen.main.bounds.width)
		.padding(.bottom)
		.padding(.horizontal)
	}
}

struct CustomTextEditor_Previews: PreviewProvider {
	static var previews: some View {
		CustomTextEditor(text: .constant(""))
	}
}
