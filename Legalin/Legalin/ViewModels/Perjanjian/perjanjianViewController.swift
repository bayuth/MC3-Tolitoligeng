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
        
        //Step 1
        pihak1NIK = ""
        pihak1Nama = ""
        pihak1TanggalLahir = Date()
        pihak1Alamat = ""
        pihak1RT = ""
        pihak1RW = ""
        pihak1Kelurahan = ""
        pihak1Kecamatan = ""
        pihak1Kota = ""
        pihak1Provinsi = ""
        pihak1Pekerjaan = ""
        pihak1NomorHP = ""
        
        //Step 2
        pihak2NIK = ""
        pihak2Nama = ""
        pihak2TanggalLahir = Date()
        pihak2Alamat = ""
        pihak2RT = ""
        pihak2RW = ""
        pihak2Kelurahan = ""
        pihak2Kecamatan = ""
        pihak2Kota = ""
        pihak2Provinsi = ""
        pihak2Pekerjaan = ""
        pihak2NomorHP = ""
        pihak2NamaBank = ""
        pihak2NomorRekening = ""
        pihak2AtasNamaRekening = ""
        
        //Step 3
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
        
        //Step 4
        modalAgunanState = false
        tipeBarangAgunan = "Detail"
        namaBarang = ""
        warnaBarang = ""
        hargaBarang = ""
        nomorSeri = ""
        
    }
    
    func updatePihak1KTP(nik: String? = "", nama: String? = "", tanggalLahir: Date? = Date(), alamat: String? = "", RT:String? = "", RW: String? = "", kelurahan: String? = "", kecamatan: String? = "", kota: String? = "", provinsi: String? = ""){
        
        pihak1NIK = nik
        pihak1Nama = nama
        pihak1TanggalLahir = tanggalLahir
        pihak1Alamat = alamat
        pihak1RT = RT
        pihak1RW = RW
        pihak1Kelurahan = kelurahan
        pihak1Kecamatan = kecamatan
        pihak1Kota = kota
        pihak1Provinsi = provinsi
    }
    
    func updatePihak1NonKTP( pekerjaan: String? = "", nomorHP: String? = ""){
        pihak1Pekerjaan = pekerjaan
        pihak1NomorHP = nomorHP
    }
    
    func updatePihak2KTP(nik: String? = "", nama: String? = "", tanggalLahir: Date? = Date(), alamat: String? = "", RT:String? = "", RW: String? = "", kelurahan: String? = "", kecamatan: String? = "", kota: String? = "", provinsi: String? = ""){
        
        pihak2NIK = nik
        pihak2Nama = nama
        pihak2TanggalLahir = tanggalLahir
        pihak2Alamat = alamat
        pihak2RT = RT
        pihak2RW = RW
        pihak2Kelurahan = kelurahan
        pihak2Kecamatan = kecamatan
        pihak2Kota = kota
        pihak2Provinsi = provinsi
        
    }
    
    func updatePihak2NonKTP(pekerjaan: String? = "", nomorHP: String? = "", namaBank: String? = "", nomorRekening: String? = "", atasNamaRekening: String? = ""){
        pihak2Pekerjaan = pekerjaan
        pihak2NomorHP = nomorHP
        pihak2NamaBank = namaBank
        pihak2NomorRekening = nomorRekening
        pihak2AtasNamaRekening = atasNamaRekening
    }
    
    func syncWithCoreData(){
        
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

