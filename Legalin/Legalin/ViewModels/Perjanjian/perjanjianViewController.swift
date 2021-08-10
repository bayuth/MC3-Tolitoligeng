//
//  perjanjianViewController.swift
//  Legalin
//
//  Created by Jason Hartanto on 05/08/21.
//

import Foundation

class PerjanjianController: ObservableObject {
    
    //Kredit attribut
    @Published var modalMetodePembayaran: Bool!
    @Published var modalPengadilanNegeri: Bool!
    @Published var metodePembayaran: String = "Metode Pembayaran"
    @Published var pengadilanNegeri: String = "Pengadilan Negeri"
    
    //Agunan attribute
    @Published var modalAgunanState: Bool!
    @Published var tipeBarangAgunan: String = "Detail"
    @Published var namaBarang: String = ""
    @Published var warnaBarang: String = ""
    @Published var hargaBarang: String = ""
    @Published var nomorSeri: String = ""
    
    init(){
        
        modalMetodePembayaran = false
        modalPengadilanNegeri = false
        
        modalAgunanState = false
        print("Re-init")
    }
    
    func setTipeBarangAgunan(selected: String){
        tipeBarangAgunan = selected
    }
    
    func setMetodePembayaran(selected: String){
        metodePembayaran = selected
    }
    
    func setPengadilanNegeri(selected: String){
        pengadilanNegeri = selected
    }
    
}

