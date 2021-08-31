//
//  ModalPengadilanNegeri.swift
//  Legalin
//
//  Created by Jason Hartanto on 02/08/21.
//

import SwiftUI

struct ModalPengadilanNegeri: View {
    
    @StateObject var dataReader = ReadData()
    @StateObject var vcDetail = PengadilanDetailController()
    @Binding var isPresented: Bool
    @Binding var pengadilanNegeri: String
    
    var provinsiData: [RegionData] = ReadData().regionData
    
    var body: some View {
        
        VStack(alignment:.leading){
            
            Text("Provinsi")
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.horizontal)
            
        ScrollView(showsIndicators: false){
            LazyVStack{
                ForEach(provinsiData, id: \.provinsi) { item in
                    NavigationLink(
                        destination:
                            ModalPengadilanNegeriDetail(dataDetail: item, kotaCount: item.kota.count, isPresented: $isPresented, pengadilanNegeri: $pengadilanNegeri)) { CheckListCell(title: item.provinsi, selected: false, mainNav: true, index: 77)
                        
                        
                        
                    }.buttonStyle(PlainButtonStyle())
                    //                    .simultaneousGesture(TapGesture().onEnded{
                    //                        vcDetail.setListSelected(total: item.kota.count)
                    //                    })
                    
                }
                
            }
            
        }
		.background(Color("defaultLightAndDarkColor"))
        .navigationBarTitle("Pengadilan Negeri", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Batalkan")
                    .foregroundColor(.white)
                    .onTapGesture {
                        isPresented = false
                    }
            }
            
        }
    }
    }
    
    
    
    struct ModalPengadilanNegeri_Previews: PreviewProvider {
        static var previews: some View {
            ModalPengadilanNegeri(isPresented: .constant(true), pengadilanNegeri: .constant("pilih"))
        }
    }
    
}
