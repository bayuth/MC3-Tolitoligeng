//
//  inputTextViewCell.swift
//  Legalin
//
//  Created by Jason Hartanto on 05/08/21.
//

import SwiftUI

struct inputTextViewCell: View {
    
    @State var title: String
    @Binding var textViewValue: String
    @State var keyboardNum: Bool
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    var emptyStateString: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text(title).font(.footnote).fontWeight(.light).padding(.horizontal)
                .padding(.top)
            
            HStack{
            
                TextField(emptyStateString, text: $textViewValue, onEditingChanged: { _ in perjanjianController.setNextButtonState() })
                    
//            TextField(emptyStateString, text: $textViewValue)
                
                .keyboardType(keyboardNum ? .numberPad : .default)
            }.padding(.horizontal)
            
            Divider()
            
        })
        
    }
}

//struct inputTextViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        inputTextViewCell(title: "Ayam",textViewValue: "", keyboardNum: true, emptyStateString: "Keos lur")
//    }
//}
