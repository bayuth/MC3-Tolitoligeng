//
//  ModalPilihKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 23/08/21.
//

import SwiftUI

struct ModalPilihKredit: View {
    @State var dataDetail: RegionData!
    var kotaCount: Int!
    @Binding var isPresented: Bool
    @Binding var pengadilanNegeri: String
    @StateObject var vc = PengadilanDetailController()
    @StateObject var vcKredit = ListKreditVM()
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
//                            vc.setSelectedPengadilan(selected: dataDetail.kota[item])
                        }

                }
            }.navigationBarTitle("Pilih Kredit", displayMode: .inline)
            .accentColor(.red)
            .navigationBarBackButtonHidden(true)
        }
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
                        pengadilanNegeri = vc.selectedPengadilan
                        isPresented = false
                    }
            }
        }
        
    }
    
}

func getSelectedKredit(listSelected: [Bool], index: Int) -> Bool {
    if (listSelected.count == 0){
        return false
    } else {
        return listSelected[index]
    }
}
