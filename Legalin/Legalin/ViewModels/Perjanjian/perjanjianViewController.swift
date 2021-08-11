//
//  perjanjianViewController.swift
//  Legalin
//
//  Created by Jason Hartanto on 05/08/21.
//

import Foundation

class PerjanjianController: ObservableObject {
    
    //Step 1 attribute
    @Published var pihak1NIK: String!
    @Published var pihak1Nama: String!
    @Published var pihak1TanggalLahir: Date!
    @Published var pihak1Alamat: String!
    @Published var pihak1RT: String!
    @Published var pihak1RW: String!
    @Published var pihak1Kelurahan: String!
    @Published var pihak1Kecamatan: String!
    @Published var pihak1Kota: String!
    @Published var pihak1Provinsi: String!
    @Published var pihak1Pekerjaan: String!
    @Published var pihak1NomorHP: String!
    
    //Step 2 attribute
    @Published var pihak2NIK: String!
    @Published var pihak2Nama: String!
    @Published var pihak2TanggalLahir: Date!
    @Published var pihak2Alamat: String!
    @Published var pihak2RT: String!
    @Published var pihak2RW: String!
    @Published var pihak2Kelurahan: String!
    @Published var pihak2Kecamatan: String!
    @Published var pihak2Kota: String!
    @Published var pihak2Provinsi: String!
    @Published var pihak2Pekerjaan: String!
    @Published var pihak2NomorHP: String!
    @Published var pihak2NamaBank: String!
    @Published var pihak2NomorRekening: String!
    @Published var pihak2AtasNamaRekening: String!
    
    //Step 3 attribute
    @Published var tujuanPeminjaman: String!
    
    @Published var jumlahPinjaman: Double!
    @Published var bunga: Double!
    @Published var tenor: Double!
    
    @Published var modalMetodePembayaran: Bool!
    @Published var metodePembayaran: String!
    
    @Published var tanggalJatuhTempo: String!
    
    @Published var modalPengadilanNegeri: Bool!
    @Published var pengadilanNegeri: String!
    
    @Published var tanggalTandaTangan: String!
    
    //Step 4 attribute
    @Published var modalAgunanState: Bool!
    @Published var tipeBarangAgunan: String!
    @Published var namaBarang: String!
    @Published var warnaBarang: String!
    @Published var hargaBarang: String!
    @Published var nomorSeri: String!
    
    init(){
        
        resetValue()
    }
    
    func resetValue(){
        
        //Page 3
        tujuanPeminjaman = ""
        jumlahPinjaman = 0
        bunga = 0
        tenor = 0
        modalMetodePembayaran = false
        metodePembayaran = "Metode Pembayaran"
        
        tanggalJatuhTempo = "Pilih Tanggal"
        
        modalPengadilanNegeri = false
        pengadilanNegeri = "Pengadilan Negeri"
        
        tanggalTandaTangan = "Pilih Tanggal"
        
        //Agunan attribute
        modalAgunanState = false
        tipeBarangAgunan = "Detail"
        namaBarang = ""
        warnaBarang = ""
        hargaBarang = ""
        nomorSeri = ""
        
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

