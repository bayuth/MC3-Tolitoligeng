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
    
    var emptyStateString: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text(title).font(.footnote).fontWeight(.light)
            
            HStack{
                
            TextField(emptyStateString, text: $textViewValue).keyboardType(keyboardNum ? .numberPad : .default)
            }
            
            Divider().padding(.horizontal, -20)
            
        }).padding(.init(top: 10, leading: 0, bottom: 5, trailing: 0))
        
    }
}

//struct inputTextViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        inputTextViewCell(title: "Ayam",textViewValue: "", keyboardNum: true, emptyStateString: "Keos lur")
//    }
//}
