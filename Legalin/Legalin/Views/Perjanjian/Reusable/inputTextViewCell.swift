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
        
//        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
//            Text(title).font(.footnote).fontWeight(.light).padding(.horizontal)
//                .padding(.top)
//            
//            VStack{
//            HStack{
//            
//                TextField(emptyStateString, text: $textViewValue, onEditingChanged: { _ in perjanjianController.setNextButtonState() })
//                    
////            TextField(emptyStateString, text: $textViewValue)
//                
//                .keyboardType(keyboardNum ? .numberPad : .default)
//            }.padding(.horizontal)
//            
//            Divider()
//            }.background(Color("emptyAlertColor").opacity(getRedIndicator() ? 0.15 : 0.0))
//            
//        })
        
        VStack(alignment: .leading) {
            
            Text(title).font(.footnote).fontWeight(.regular).foregroundColor(Color("labelColor")).padding(.horizontal)
            //                TextField(title, text: $profileValue).font(.body).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))).padding(.horizontal)
            VStack{
                DoneKeyboard(text: $textViewValue, hint: emptyStateString, keyType: keyboardNum ? UIKeyboardType.numberPad : UIKeyboardType.default, onEndEditing: {perjanjianController.setNextButtonState()},clearOnStartEdit: false)
                    .foregroundColor(Color("formViewColor"))
                    .lineLimit(3)
                    .accentColor(Color("tabBarColor"))
                    .font(.body)
//                    .disabled(isDisable)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 20)
                    .padding(.horizontal)
                Divider()
                
            }.background(Color("emptyAlertColor").opacity(getRedIndicator() ? 0.15 : 0.0))
            
        }
        .padding(.bottom)
        
    }
    func getRedIndicator() -> Bool{
        if(title != "Nomor Seri Opsional"){
        if ((textViewValue == "") && (perjanjianController.endButtonPressed == true)){
            return true
        } else {
            return false
        }
        }else{
            return false
        }
    }
}

//struct inputTextViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        inputTextViewCell(title: "Ayam",textViewValue: "", keyboardNum: true, emptyStateString: "Keos lur")
//    }
//}
