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
    @StateObject var vc = pengadilanDetailController()
    
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
                        }
                    
                }
            }.navigationBarTitle("", displayMode: .inline)
        }.onAppear {
            vc.setListSelected(total: kotaCount)
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

struct ModalPengadilanNegeriDetail_Previews: PreviewProvider {
    static var previews: some View {
        ModalPengadilanNegeriDetail()
    }
}
