//
//  TestKeyboard.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 18/08/21.
//

import SwiftUI
import UIKit

struct DoneKeyboard: UIViewRepresentable {
    
    @Binding var text: String
    var hint: String
    var keyType: UIKeyboardType
    
    func makeCoordinator() -> Coordinator {
        return DoneKeyboard.Coordinator(parent: self)
    }
    
    
    func makeUIView(context: Context) -> UITextField{
        let textField = UITextField()
        textField.text = text
        textField.font = .systemFont(ofSize: 17)
        textField.keyboardType = keyType
        textField.attributedPlaceholder = NSAttributedString(string: hint, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
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
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    class Coordinator: NSObject, UITextFieldDelegate{
        var parent: DoneKeyboard
        
        init(parent: DoneKeyboard){
            self.parent = parent
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
        func textFieldDidEndEditing(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
    }

}

extension UITextField{
    @objc func doneButtonTapped(button: UIBarButtonItem) -> Void{
        self.resignFirstResponder()
    }
}


