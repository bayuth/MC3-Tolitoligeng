//
//  perjanjianViewController.swift
//  Legalin
//
//  Created by Jason Hartanto on 05/08/21.
//

import Foundation

class PerjanjianController: ObservableObject {
    
    //Agunan attribute
    @Published var modalAgunanState: Bool!
    @Published var tipeBarangAgunan: String = "Detail"
    @Published var namaBarang: String = ""
    @Published var warnaBarang: String = ""
    @Published var hargaBarang: String = ""
    @Published var nomorSeri: String = ""
    
    init(){
        modalAgunanState = false
        print("Re-init")
    }
    
    func setTipeBarangAgunan(selected: String){
        tipeBarangAgunan = selected
    }
    
}

