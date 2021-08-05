//
//  inputToModal.swift
//  Legalin
//
//  Created by Jason Hartanto on 05/08/21.
//

import SwiftUI

struct inputToModal: View {
    
    @State var title: String
    @State var textViewValue: String
    @Binding var tipeAgunan: String
    @State var isPresented: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text(title).font(.footnote).fontWeight(.light)
            
            HStack{
            
            Text(title)
            
                Spacer()
                
                HStack{
                    Text(tipeAgunan)
                    Image(systemName: "chevron.right")
                }
                .sheet(isPresented: $isPresented){
                    NavigationView{
                        ModalTipeBarangAgunan(isPresented: $isPresented, tipeAgunan: $tipeAgunan)
                    }
                    }
                .onTapGesture {
                    isPresented = true
                }
                
            }.padding(.top, 5)
            Divider().padding(.horizontal, -20)
                
            
        }).padding(.init(top: 10, leading: 0, bottom: 5, trailing: 0))
    
    }
    
}

//struct inputToModal_Previews: PreviewProvider {
//    static var previews: some View {
//        inputToModal(title: "Detail", textViewValue: "Detail")
//    }
//}
