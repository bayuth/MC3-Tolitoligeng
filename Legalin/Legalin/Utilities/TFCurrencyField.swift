//
//  dsd.swift
//  Legalin
//
//  Created by Achmad Fathullah on 27/08/21.
//

import SwiftUI

import Foundation

struct TFCurrencyField: UIViewRepresentable {
    @Binding var urlString: String
    @State var onEndEditing:() -> ()
    @State var placeHolderText = ""
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $urlString, onEditing: onEndEditing)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeHolderText
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.keyboardType = .decimalPad
        
        
        textField.delegate = context.coordinator
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
        
        toolbar.barStyle = .default
        toolbar.items = [spacer,doneButton]
        toolbar.sizeToFit()
        toolbar.setItems([spacer,doneButton], animated: true)
        textField.inputAccessoryView = toolbar
        
        return textField
    }
    
    func updateUIView(_ view: UITextField, context: Context) {
        view.text = urlString
    }
}

extension TFCurrencyField {
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        var oldText = ""
        @State var onEndEditing :() -> ()
        var isFirstEditing = false
        
        init(text: Binding<String>, onEditing: @escaping () -> Void) {
            _text = text
            self.onEndEditing = onEditing
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.oldText = textField.text!
                if self.isFirstEditing {
                    self.text = Double(self.oldText)?.toRupiahString() ?? ""
                    self.isFirstEditing = false
                }else{
                    self.text = Double(self.oldText.digits)?.toRupiahString() ?? ""
                }
            }
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            text = ""
            isFirstEditing = true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            onEndEditing()
        }
    }
}
