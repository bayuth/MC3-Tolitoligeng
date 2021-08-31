//
//  ListKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 05/08/21.
//

import SwiftUI

class ListKreditVM: ObservableObject {
    @Published var object = ItemListKredit()
    
    var coreDataVM: CoreDataViewModel = .shared
    
    static let shared = ListKreditVM()
    
    
    @Published var list : [ItemListKredit] = []
    
    init() {
        fillListDone()
    }
    
    
    func hasZeroData() -> Bool {
        return object.tenor.isZero || object.kreditTitle.isEmpty || object.jumlahPinjaman.isZero
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
        fillListDone()
    }
    
    func deleteKredit(index :Int) {
        coreDataVM.deleteKredit(kredit: coreDataVM.listKredit[index])
        coreDataVM.getAllKredit()
        fillListDone()
    }
    
    func deleteDetailKredit(index :Int) {
        coreDataVM.deleteKredit(kredit: coreDataVM.listKredit[index])
    }
}

