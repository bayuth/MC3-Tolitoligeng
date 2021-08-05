//
//  ModalMetodePembayaran.swift
//  Legalin
//
//  Created by Jason Hartanto on 02/08/21.
//

import SwiftUI

struct ModalMetodePembayaran: View {
    
    @StateObject var stateController = SelectedController()
    
    var body: some View {
        VStack(alignment: .leading){
                Text("Kepada Pemberi Pinjaman")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                
                Spacer()
                
                ScrollView{
                    
                    CheckListCell(title: "Cicilan", selected: stateController.selected, mainNav: false, index: 0)
                        .onTapGesture {
                            stateController.setSelectedState(sender: "selected")
                        }
                    CheckListCell(title: "Kontan", selected: stateController.selected2, mainNav: false, index: 1)
                        .onTapGesture {
                            stateController.setSelectedState(sender: "selected2")
                        }
                }
                
            }
        }
}

struct ModalMetodePembayaran_Previews: PreviewProvider {
    static var previews: some View {
        ModalMetodePembayaran()
    }
}

