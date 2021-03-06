//
//  FormView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 04/08/21.
//

import SwiftUI
import UIKit

struct FormView: View {
    
    @Environment (\.colorScheme) var colorScheme
    @State var title:String
    @Binding var profileValue:String
    @State var keyboardNum:Bool
    @Binding var isDisable:Bool
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    var body: some View {
        
        if isDisable{
            VStack(alignment: .leading) {
                
                Text(title).font(.footnote).fontWeight(.regular).foregroundColor(Color("labelColor")).padding(.horizontal)
                VStack{
                    TextField(title, text: $profileValue)
                        .disabled(isDisable)
                        .font(.body)
                        .foregroundColor(Color("labelColor"))
                        .padding(.horizontal)
                        .lineLimit(3)
                    
                    Divider()
                }.background(Color("emptyAlertColor").opacity(getRedIndicator() ? 0.15 : 0.0))
                
            }.padding(.bottom)
            
        } else {
            VStack(alignment: .leading) {
                
                Text(title).font(.footnote).fontWeight(.regular).foregroundColor(Color("labelColor")).padding(.horizontal)
                //				TextField(title, text: $profileValue).font(.body).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))).padding(.horizontal)
                VStack{
                    DoneKeyboard(text: $profileValue, hint: title, keyType: keyboardNum ? UIKeyboardType.numberPad : UIKeyboardType.default, onEndEditing: {},clearOnStartEdit: false)
                        .foregroundColor(Color("formViewColor"))
                        .lineLimit(3)
                        .accentColor(Color("tabBarColor"))
                        .font(.body)
                        .disabled(isDisable)
						.fixedSize(horizontal: false, vertical: true)
						.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 20)
						.clipped()
                        .padding(.horizontal)
                    Divider()
                    
                }.background(Color("emptyAlertColor").opacity(getRedIndicator() ? 0.15 : 0.0))
            }
            .padding(.bottom)
        }
    }
    func getRedIndicator() -> Bool{
        if ((profileValue == "") && (perjanjianController.endButtonPressed == true)){
            return true
        } else {
            return false
        }
    }
}
