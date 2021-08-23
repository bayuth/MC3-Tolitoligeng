//
//  PerjanjianViewModel.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 02/08/21.
//

import SwiftUI

class PerjanjianViewModel: ObservableObject {
    
    var coreDataVM: CoreDataViewModel = .shared
    
    static let shared = PerjanjianViewModel()
    
    @Published var listDraft : [Agreements] = [
        Agreements(agreementTitle: "Perjanjian 1", amountOfLoan: "Rp. 25.000.000", Date: "25/07/2021", lenderName: "Bambang oke", signStatus: false, offset: 0, isSwiped: false),
        Agreements(agreementTitle: "Perjanjian 2", amountOfLoan: "Rp. 25.000.000", Date: "25/07/2021", lenderName: "Bambang oke", signStatus: false, offset: 0, isSwiped: false),
        Agreements(agreementTitle: "Perjanjian 3", amountOfLoan: "Rp. 25.000.000", Date: "25/07/2021", lenderName: "Bambang oke", signStatus: false, offset: 0, isSwiped: false),
        Agreements(agreementTitle: "Perjanjian 4", amountOfLoan: "Rp. 25.000.000", Date: "25/07/2021", lenderName: "Bambang oke", signStatus: false, offset: 0, isSwiped: false),
        Agreements(agreementTitle: "Perjanjian 5", amountOfLoan: "Rp. 25.000.000", Date: "25/07/2021", lenderName: "Bambang oke", signStatus: false, offset: 0, isSwiped: false),
    ]
    
    @Published var listOnGoing : [Agreements] = []
    @Published var listDone : [Agreements] = []
//
//    init(){
//        fillAllAgreement()
//    }
//
//    func fillAllAgreement(){
//        fillListDraft()
//        fillListOnGoing()
//        fillListDone()
//    }
//
//    func fillListDraft(){
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        formatter.locale = Locale(identifier: "id_ID")
//        let listPinjamanDraft = coreDataVM.listPinjamanDraft
//        let dateFormatting = DateFormatter()
//        dateFormatting.dateFormat = "dd/MM/YYYY"
//
//        listDraft = []
//        for item in listPinjamanDraft{
//            listDraft.append(Agreements(agreementTitle: getTujuan(tujuan: item.tujuan ?? ""), amountOfLoan: formatter.string(from: NSNumber(value: item.kredit?.jumlahPinjaman ?? 0)) ?? "", Date: dateFormatting.string(from: item.dateModified ?? Date()), lenderName: item.pihak2?.ktp?.nama ?? "", signStatus: false, offset: 0, isSwiped: false, pinjaman: item))
//        }
//
//    }
//    func getTujuan(tujuan: String) -> String {
//        if tujuan == ""{
//            return "Draft"
//        }
//        else{
//            return tujuan
//        }
//    }
//
//    func fillListOnGoing(){
//
//        //Data yang belum ttd
//        let listPinjamanNotSigned = coreDataVM.listPinjamanNotSigned
//
//        //Data yang udah ttd
//        let listPinjamanOnGoing = coreDataVM.listPinjamanOnGoing
//
//        let dateFormatting = DateFormatter()
//        dateFormatting.dateFormat = "dd/MM/YYYY"
//
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        formatter.locale = Locale(identifier: "id_ID")
//        listOnGoing = []
//
//        //Masukin yang belum ttd
//        for item in listPinjamanNotSigned{
//            listOnGoing.append(Agreements(agreementTitle: item.kredit?.namaSimulasi ?? "", amountOfLoan: formatter.string(from: NSNumber(value: item.kredit?.jumlahPinjaman ?? 0)) ?? "",Date: dateFormatting.string(from: item.dateModified ?? Date()), lenderName: item.pihak2?.ktp?.nama ?? "", signStatus: false, offset: 0, isSwiped: false, pinjaman: item))
//        }
//
//        //Masukin yang udah ttd
//        for item in listPinjamanOnGoing{
//            listOnGoing.append(Agreements(agreementTitle: item.kredit?.namaSimulasi ?? "", amountOfLoan: formatter.string(from: NSNumber(value: item.kredit?.jumlahPinjaman ?? 0)) ?? "", Date: dateFormatting.string(from: item.dateModified ?? Date()), lenderName: item.pihak2?.ktp?.nama ?? "", signStatus: false, offset: 0, isSwiped: false, pinjaman: item))
//        }
//    }
//
//    func fillListDone() {
//
//        //Data riwayat
//        let listPinjamanDone = coreDataVM.listPinjamanDone
//        let dateFormatting = DateFormatter()
//        dateFormatting.dateFormat = "dd/MM/YYYY"
//
//        listDone = []
//
//        for item in listPinjamanDone{
//            listDone.append(Agreements(agreementTitle: item.kredit?.namaSimulasi ?? "", amountOfLoan: String(item.kredit?.jumlahPinjaman ?? 0), Date: dateFormatting.string(from: item.dateModified ?? Date()), lenderName: item.pihak2?.ktp?.nama ?? "", signStatus: false, offset: 0, isSwiped: false, pinjaman: item))
//        }
//
//    }
}
