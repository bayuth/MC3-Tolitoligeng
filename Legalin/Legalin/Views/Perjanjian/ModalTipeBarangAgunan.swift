//
//  ModalTipeBarangAgunan.swift
//  Legalin
//
//  Created by Jason Hartanto on 02/08/21.
//

import SwiftUI

struct ModalTipeBarangAgunan: View {
    var body: some View {
        VStack(alignment: .leading){
                Text("Tipe Barang Agunan")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                
                Spacer()
                
                ScrollView{
                    
                    CheckListCell(title: "Umum", selected: false)
                    CheckListCell(title: "Elektronik", selected: true)
                    
                }
                
            }
        }
}

struct ModalTipeBarangAgunan_Previews: PreviewProvider {
    static var previews: some View {
        ModalTipeBarangAgunan()
    }
}
