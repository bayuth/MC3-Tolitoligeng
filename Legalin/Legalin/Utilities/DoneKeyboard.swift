//
//  TestKeyboard.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 18/08/21.
//

import SwiftUI
import UIKit

struct DoneKeyboard: UIViewRepresentable {
    
    @State var text: String
    var hint: String
    var keyType: UIKeyboardType
    
    func makeCoordinator() -> Coordinator {
        return DoneKeyboard.Coordinator()
    }
    
    
    func makeUIView(context: Context) -> UITextField{
        let textView = UITextField()
        textView.text = text
        textView.font = .systemFont(ofSize: 17)
        textView.keyboardType = keyType
        textView.attributedPlaceholder = NSAttributedString(string: hint, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(textView.doneButtonTapped(button:)))
        
        toolbar.barStyle = .default
        toolbar.items = [spacer,doneButton]
        toolbar.sizeToFit()
        toolbar.setItems([spacer,doneButton], animated: true)
        textView.inputAccessoryView = toolbar
        return textView
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }

}

extension UITextField{
    @objc func doneButtonTapped(button: UIBarButtonItem) -> Void{
        self.resignFirstResponder()
    }
}


