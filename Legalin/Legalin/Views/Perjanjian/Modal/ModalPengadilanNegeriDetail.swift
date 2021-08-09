//
//  ModalPengadilanNegeriDetail.swift
//  Legalin
//
//  Created by Jason Hartanto on 03/08/21.
//

import SwiftUI

struct ModalPengadilanNegeriDetail: View {
    
    @State var dataDetail: RegionData!
    var kotaCount: Int!
    @Binding var isPresented: Bool
    @Binding var pengadilanNegeri: String
    @StateObject var vc = PengadilanDetailController()
    
    var body: some View {
        
        VStack{
            Spacer()
            ScrollView{
                
                ForEach(0..<dataDetail.kota.count){item in
                    
                    CheckListCell(title: "\(dataDetail.kota[item])", selected: getSelectedStatus(listSelected: vc.listSelected, index: item)
//                                    vc.listSelected[item]
                                  , mainNav: false, index: item)
                        .onTapGesture {
                            vc.toggleView(index: item)
                            vc.setSelectedPengadilan(selected: dataDetail.kota[item])
                        }
                    
                }
            }.navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
        }.onAppear {
            vc.setListSelected(total: kotaCount)
        }.toolbar {
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
                            pengadilanNegeri = vc.selectedPengadilan
//                            if (stateController.selected == true){
//                                  metodePembayaran = "Cicilan"
//                            } else {
//                                metodePembayaran = "Kontan"
//                            }
                            
                        isPresented = false
                        }
                }
            }
        
    }
    
}

func getSelectedStatus(listSelected: [Bool], index: Int) -> Bool {
    if (listSelected.count == 0){
        return false
    } else {
        return listSelected[index]
    }
}

//struct ModalPengadilanNegeriDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalPengadilanNegeriDetail()
//    }
//}
