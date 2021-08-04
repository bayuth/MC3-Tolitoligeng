//
//  ModalPengadilanNegeri.swift
//  Legalin
//
//  Created by Jason Hartanto on 02/08/21.
//

import SwiftUI

struct ModalPengadilanNegeri: View {
    
    @StateObject var dataReader = ReadData()
    @StateObject var vcDetail = pengadilanDetailController()
    
    var provinsiData: [RegionData] = ReadData().regionData
    
    var body: some View {
        
        NavigationView{
        ScrollView{
            LazyVStack{
                ForEach(provinsiData, id: \.provinsi) { item in
                    NavigationLink(
                        destination:
                            ModalPengadilanNegeriDetail(dataDetail: item, kotaCount: item.kota.count)) { CheckListCell(title: item.provinsi, selected: false, mainNav: true, index: 77)

                                
                                
                    }.buttonStyle(PlainButtonStyle())
//                    .simultaneousGesture(TapGesture().onEnded{
//                        vcDetail.setListSelected(total: item.kota.count)
//                    })
                    
                }
                    
                }
                
                }.navigationBarHidden(true)
            }
        }
    }



struct ModalPengadilanNegeri_Previews: PreviewProvider {
    static var previews: some View {
        ModalPengadilanNegeri()
    }
}

