//
//  MultiLineFormView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 23/08/21.
//

import SwiftUI

struct MultiLineFormView: View {
	@Binding var alamat:String
	@Binding var isDisable:Bool
	@State var emptyAlamat:String = "Type here"
	var placeholderString = "Alamat"
	
//	Auto updating textbox height
	@State var containerHeight:CGFloat = 0
	
    var body: some View {
		VStack(alignment: .leading) {
			Text("Alamat").font(.footnote).fontWeight(.regular).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1))).padding(.horizontal)
			if isDisable {
				AutoSizingTF(hint: "Alamat Sesuai KTP", text: $alamat, containerHeight: $containerHeight, onEnd: {
					UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
				})
					.foregroundColor(Color("labelColor"))
					.disabled(true)
					.padding(.horizontal)
					.frame(height: containerHeight <= 120 ? containerHeight : 120)
	//				.background(Color(#colorLiteral(red: 0.9937283397, green: 0.9430401325, blue: 0.9090076685, alpha: 1)))
					.cornerRadius(10)
			} else {
				AutoSizingTF(hint: "Alamat Sesuai KTP", text: $alamat, containerHeight: $containerHeight, onEnd: {
					UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
				})
				.accentColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
					.padding(.horizontal)
					.frame(height: containerHeight <= 120 ? containerHeight : 120)
					.cornerRadius(10)
			}
			
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
	}
}

struct MultiLineFormView_Previews: PreviewProvider {
    static var previews: some View {
		MultiLineFormView(alamat: .constant(""), isDisable: .constant(false), emptyAlamat: "Alamat")
    }
}

struct AutoSizingTF: UIViewRepresentable {
	
	var hint: String
	@Binding var text: String
	@Binding var containerHeight: CGFloat
	var onEnd : ()->()
	
	func makeCoordinator() -> Coordinator {
		return AutoSizingTF.Coordinator(parent: self)
	}
	
	func makeUIView(context: Context) -> UITextView {
//		let textView = UITextField()
		let textView = UITextView()
//		display hint
		if textView.text == nil {
			textView.text = hint
//			textView.textColor = .gray
			textView.font = .systemFont(ofSize: 18)
		} else {
			textView.text = text
//			textView.textColor = .black
			textView.font = .systemFont(ofSize: 18)
		}
		
//		textView.text = text
//		textView.font = .systemFont(ofSize: 18)
		textView.backgroundColor = .clear
		
		
		textView.delegate = context.coordinator
		
//		input acessory view
		let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
		toolBar.barStyle = .default
		
//		position done buttonn at top right
		let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(context.coordinator.closeKeyboard))
		
		toolBar.items = [spacer,doneButton]
		toolBar.sizeToFit()
		
		textView.inputAccessoryView = toolBar
		
		return textView
	}
	
	func updateUIView(_ uiView: UITextView, context: Context) {
		DispatchQueue.main.async {
			if containerHeight == 0 {
				containerHeight = uiView.contentSize.height
			}
		}
	}
	
	class Coordinator: NSObject, UITextViewDelegate {
//		to read parent properties
		var parent: AutoSizingTF
		
		init(parent: AutoSizingTF) {
			self.parent = parent
		}
		
//		keyboard close @objc method
		@objc func closeKeyboard() {
			parent.onEnd()
		}
		
		func textViewDidBeginEditing(_ textView: UITextView) {
//			clear the placeholder if empty
			if textView.text == parent.hint {
				textView.text = ""
//				textView.textColor = UIColor(Color.primary)
			}
		}
		
//		updating text in SwifUI
		func textViewDidChange(_ textView: UITextView) {
			parent.text = textView.text ?? ""
			parent.containerHeight = textView.contentSize.height
		}
		
//		on ending check if textbox is empty, if yes the put placeholder back
		func textViewDidEndEditing(_ textView: UITextView) {
			if textView.text == "" {
				textView.text = parent.hint
//				textView.textColor = .gray
			}
		}
	}
}

