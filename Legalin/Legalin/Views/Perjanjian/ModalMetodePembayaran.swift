//
//  ModalMetodePembayaran.swift
//  Legalin
//
//  Created by Jason Hartanto on 02/08/21.
//

import SwiftUI

struct ModalMetodePembayaran: View {
    var body: some View {
        VStack(alignment: .leading){
                Text("Kepada Pemberi Pinjaman")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                
                Spacer()
                
                ScrollView{
                    
                    CheckListCell(title: "Cicilan", selected: true)
                    CheckListCell(title: "Kontan", selected: false)
                    
                }
                
            }
        }
}

struct ModalMetodePembayaran_Previews: PreviewProvider {
    static var previews: some View {
        ModalMetodePembayaran()
    }
}

