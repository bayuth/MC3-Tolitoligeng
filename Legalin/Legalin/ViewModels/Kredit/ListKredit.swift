//
//  ListKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 05/08/21.
//

import SwiftUI

class ListKreditVM: ObservableObject {
    @Published var object = ItemListKredit()
    /*
    @Published var list = [
        ItemListKredit(kreditTitle: "Nikah istri 1", tenor: 24, bunga: 6, jumlahPinjaman: 12000000, cicilanPerbulan: 2500000, offset: 0, isSwiped: false),
        ItemListKredit(kreditTitle: "Nikah istri 2", tenor: 24, bunga: 6, jumlahPinjaman: 12000000, cicilanPerbulan: 2500000, offset: 0, isSwiped: false),
        ItemListKredit(kreditTitle: "Nikah istri 3", tenor: 24, bunga: 6, jumlahPinjaman: 12000000, cicilanPerbulan: 2500000, offset: 0, isSwiped: false),
        ItemListKredit(kreditTitle: "Nikah istri 4", tenor: 24, bunga: 6, jumlahPinjaman: 12000000, cicilanPerbulan: 2500000, offset: 0, isSwiped: false),
    ]
     */
    
    var coreDataVM: CoreDataViewModel = .shared
    
    static let shared = ListKreditVM()
    
    
    @Published var list : [ItemListKredit] = []
    
    init() {
        fillListDone()
    }
    
    func hasNilField() -> Bool {
        return object.kreditTitle == "" && object.jumlahPinjaman == 0.0 && object.tenor == 0.0
    }
    
    func fillListDone() {
        
        //Data riwayat
        let listKredit = coreDataVM.listKredit
        
        list = []
        
        for item in listKredit{
            list.append(ItemListKredit(kreditTitle: item.namaSimulasi ?? "", tenor: item.tenor, bunga: item.bunga, jumlahPinjaman: item.jumlahPinjaman, cicilanPerbulan: 0, offset: 0, isSwiped: false))
        }
        
    }
    
    func addNewDataCredit(itemListKredit : ItemListKredit){
        coreDataVM.updateKredit(kredit: coreDataVM.createKredit(pinjamanPage: false), nama: itemListKredit.kreditTitle, bunga: itemListKredit.bunga, jumlahPinjaman: itemListKredit.jumlahPinjaman, tenor: itemListKredit.tenor)
        coreDataVM.getAllKredit()
        fillListDone()
    }
}
