//
//  ModalMetodePembayaran.swift
//  Legalin
//
//  Created by Jason Hartanto on 02/08/21.
//

import SwiftUI

struct ModalMetodePembayaran: View {
    
    @StateObject var stateController = SelectedController()
    @Binding var isPresented: Bool
    @Binding var metodePembayaran: String
    
    var body: some View {
        VStack(alignment: .leading){
                Text("Kepada Pemberi Pinjaman")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                
                Spacer()
                
                ScrollView(showsIndicators: false){
                    
                    CheckListCell(title: "Cicilan", selected: stateController.selected, mainNav: false, index: 0)
                        .onTapGesture {
                            stateController.setSelectedState(sender: "selected")
                        }
                    CheckListCell(title: "Kontan", selected: stateController.selected2, mainNav: false, index: 1)
                        .onTapGesture {
                            stateController.setSelectedState(sender: "selected2")
                        }
                }
                
            }.padding(.vertical, 20)
        .navigationBarTitle("Tipe Pembayaran", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Batalkan")
                    .foregroundColor(.white)
                    .onTapGesture {
                        isPresented = false
                    }
            }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Done")
                        .foregroundColor(.white)
                        .onTapGesture {
                            if (stateController.selected == true){
                                  metodePembayaran = "Cicilan"
                            } else {
                                metodePembayaran = "Kontan"
                            }
                            
                        isPresented = false
                        }
                }
            }
        
        }
}

//struct ModalMetodePembayaran_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalMetodePembayaran()
//    }
//}

