//
//  ModalPilihKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 23/08/21.
//

import SwiftUI

struct ModalPilihKredit: View {
    @Binding var isPresented: Bool
    @StateObject var vc = PengadilanDetailController()
    @StateObject var vcKredit = ListKreditVM()
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack{
            Spacer()
            ScrollView(showsIndicators: false){
                Text("Kredit Pinjaman")
                    .font(.system(size: 17))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                ForEach(0..<vcKredit.list.count){item in
                    KreditChecklistCell(title: vcKredit.list[item].kreditTitle, rupiah: vcKredit.list[item].jumlahPinjaman, selected: getSelectedStatus(listSelected: vc.listSelected, index: item), mainNav: false, index: item)
                        .onTapGesture {
                            vc.toggleView(index: item)
                            let selectedKredit = vcKredit.list[item]
                            perjanjianController.tujuanPeminjaman = selectedKredit.kreditTitle
                            perjanjianController.jumlahPinjaman = selectedKredit.jumlahPinjaman
                            perjanjianController.bunga = selectedKredit.bunga
                            perjanjianController.tenor = selectedKredit.tenor
                        }
                }
            }.navigationBarTitle("Pilih Kredit", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
        }
		.background(Color("defaultLightAndDarkColor"))
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .onAppear {
            vc.setListSelected(total: vcKredit.list.count)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack{
                    Text("Batalkan").foregroundColor(.white)
                }
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("Done")
                    .foregroundColor(.white)
                    .onTapGesture {
                        isPresented = false
                    }
            }
        }
        
    }
    
}
