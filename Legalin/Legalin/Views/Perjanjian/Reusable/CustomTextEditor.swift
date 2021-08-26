//
//  CustomTextEditor.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 25/08/21.
//

import SwiftUI

struct CustomTextEditor: View {
    var body: some View {
        TextEditor(text: /*@START_MENU_TOKEN@*/.constant("Placeholder")/*@END_MENU_TOKEN@*/)
    }
}

struct CustomTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextEditor()
    }
}
