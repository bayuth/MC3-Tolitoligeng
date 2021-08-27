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
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack(alignment:.leading){
            
            Text("Provinsi")
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.horizontal)
    
            ScrollView(showsIndicators: false){
                
                ForEach(0..<dataDetail.kota.count){item in
                    
                    CheckListCell(title: "\(dataDetail.kota[item])", selected: getSelectedStatus(listSelected: vc.listSelected, index: item)
//                                    vc.listSelected[item]
                                  , mainNav: false, index: item)
                        .onTapGesture {
                            vc.toggleView(index: item)
                            vc.setSelectedPengadilan(selected: dataDetail.kota[item])
                        }
                    
                }
            }
			.background(Color("defaultLightAndDarkColor"))
            .navigationBarTitle(dataDetail.provinsi, displayMode: .inline)
            .accentColor(.red)
            .navigationBarBackButtonHidden(true)
        }.onAppear {
            vc.setListSelected(total: kotaCount)
        }.toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack{
                    Image(systemName: "chevron.backward").aspectRatio(contentMode: .fill).foregroundColor(.white)
                    Text("Kembali").foregroundColor(.white)
                }
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Selesai")
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
