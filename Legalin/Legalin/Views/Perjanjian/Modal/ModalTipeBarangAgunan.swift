//
//  ModalTipeBarangAgunan.swift
//  Legalin
//
//  Created by Jason Hartanto on 02/08/21.
//

import SwiftUI

struct ModalTipeBarangAgunan: View {
    
    @StateObject var stateController = selectedController()
    
    var body: some View {
        VStack(alignment: .leading){
                Text("Tipe Barang Agunan")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                
                Spacer()
                
                ScrollView{
                    
                    CheckListCell(title: "Umum", selected: stateController.selected, mainNav: false, index: 0)
                        .onTapGesture {
                            stateController.setSelectedState(sender: "selected")
                        }
                    CheckListCell(title: "Elektronik", selected: stateController.selected2, mainNav: false, index: 1)
                        .onTapGesture {
                            stateController.setSelectedState(sender: "selected2")
                        }
                    
                }
                
            }
        }
}

struct ModalTipeBarangAgunan_Previews: PreviewProvider {
    static var previews: some View {
        ModalTipeBarangAgunan()
    }
}
