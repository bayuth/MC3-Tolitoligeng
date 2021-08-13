//
//  perjanjianViewController.swift
//  Legalin
//
//  Created by Jason Hartanto on 05/08/21.
//

import Foundation

class PerjanjianController: ObservableObject {
    
    static let shared = PerjanjianController()
    
    var mainPageVM: PerjanjianViewModel = .shared
    var coreDataVM: CoreDataViewModel = .shared
    
    var profil: [Akun] = []
    
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
    
    @Published var nextButtonState : Bool!
    
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
        
        nextButtonState = false
        
        profil = coreDataVM.pihak1
        sycnPihak1()
    }
    
    func sycnPihak1(){
        if (profil != []){
            pihak1NIK = profil[0].ktp?.nik ?? ""
            pihak1Nama = profil[0].ktp?.nama ?? ""
            pihak1TanggalLahir = profil[0].ktp?.tanggalLahir ?? Date()
            pihak1Alamat = profil[0].ktp?.alamat ?? ""
            pihak1RT = profil[0].ktp?.rt ?? ""
            pihak1RW = profil[0].ktp?.rw ?? ""
            pihak1Kelurahan = profil[0].ktp?.kelurahanDesa ?? ""
            pihak1Kecamatan = profil[0].ktp?.kecamatan ?? ""
            pihak1Kota = profil[0].ktp?.kotaKabupaten ?? ""
            pihak1Provinsi = profil[0].ktp?.provinsi ?? ""
            pihak1Pekerjaan = profil[0].pekerjaan ?? ""
            pihak1NomorHP = profil[0].nomorAktif ?? ""
        }
    }
    
    func checkEmptyString(item: String){
        if (item == ""){
            nextButtonState = false
        }
    }
    
    func checkEmptyDouble(item: Double){
        if (item == 0){
            nextButtonState = false
        }
    }
    
    func setNextButtonState() {
        
        nextButtonState = true
        
        checkEmptyString(item: pihak1NIK)
        checkEmptyString(item: pihak1Nama)
        checkEmptyString(item: pihak1Alamat)
        checkEmptyString(item: pihak1RT)
        checkEmptyString(item: pihak1RW)
        checkEmptyString(item: pihak1Kelurahan)
        checkEmptyString(item: pihak1Kecamatan)
        checkEmptyString(item: pihak1Kota)
        checkEmptyString(item: pihak1Provinsi)
        checkEmptyString(item: pihak1Pekerjaan)
        checkEmptyString(item: pihak1NomorHP)
        
        checkEmptyString(item: pihak2NIK)
        checkEmptyString(item: pihak2Nama)
        checkEmptyString(item: pihak2Alamat)
        checkEmptyString(item: pihak2RT)
        checkEmptyString(item: pihak2RW)
        checkEmptyString(item: pihak2Kelurahan)
        checkEmptyString(item: pihak2Kecamatan)
        checkEmptyString(item: pihak2Kota)
        checkEmptyString(item: pihak2Provinsi)
        checkEmptyString(item: pihak2Pekerjaan)
        checkEmptyString(item: pihak2NomorHP)
        checkEmptyString(item: pihak2NamaBank)
        checkEmptyString(item: pihak2NomorRekening)
        checkEmptyString(item: pihak2AtasNamaRekening)
        
        //Step 3
        checkEmptyString(item: tujuanPeminjaman)
        checkEmptyDouble(item: jumlahPinjaman)
        checkEmptyDouble(item: bunga)
        checkEmptyDouble(item: tenor)
        
        if (metodePembayaran == "Metode Pembayaran"){
            nextButtonState = false
        }
        
        if (tanggalJatuhTempo == "Pilih Tanggal"){
            nextButtonState = false
        }
        
        if (pengadilanNegeri == "Pengadilan Negeri"){
            nextButtonState = false
        }
        
        if (tanggalTandaTangan == "Pilih Tanggal"){
            nextButtonState = false
        }
        
        if (modalAgunanState == true){
            
            if (tipeBarangAgunan == "Detail"){
                nextButtonState = false
            }
            
            checkEmptyString(item: namaBarang)
            checkEmptyString(item: warnaBarang)
            checkEmptyString(item: hargaBarang)
            
            if (tipeBarangAgunan == "Elektronik"){
                checkEmptyString(item: nomorSeri)
            }
            
        }
        
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
    
    func updatePinjamanCoreData(status: StatusSurat){
        
        var newPinjaman = coreDataVM.createPinjaman()
        //Update pinjaman atribut
        coreDataVM.updatePinjaman(pinjaman: newPinjaman, tujuan: tujuanPeminjaman, metodePembayaran: metodePembayaran, jatuhTempo: tanggalJatuhTempo, pengadilanNegeri: pengadilanNegeri, tanggalTandaTangan: tanggalTandaTangan, status: status)
        
        //Update pihak1 atribut
        coreDataVM.updateAkun(akun: newPinjaman.pihak1! , NIK: pihak1NIK, nama: pihak1Nama, tanggalLahir: pihak1TanggalLahir, alamat: pihak1Alamat, rt: pihak1RT, rw: pihak1RW, kecamatan: pihak1Kecamatan, kelurahanDesa: pihak1Kelurahan, kotaKabupaten: pihak1Kota, provinsi: pihak1Provinsi, pekerjaan: pihak1Pekerjaan, nomorAktif: pihak1NomorHP)
        
        //Update pihak2 atribut
        coreDataVM.updateAkun(akun: newPinjaman.pihak2! , NIK: pihak2NIK, nama: pihak2Nama, tanggalLahir: pihak2TanggalLahir, alamat: pihak2Alamat, rt: pihak2RT, rw: pihak2RW, kecamatan: pihak2Kecamatan, kelurahanDesa: pihak2Kelurahan, kotaKabupaten: pihak2Kota, provinsi: pihak2Provinsi, pekerjaan: pihak2Pekerjaan, nomorAktif: pihak2NomorHP)
        
        //Update kredit atribut
        coreDataVM.updateKredit(kredit: newPinjaman.kredit!, nama: tujuanPeminjaman, bunga: bunga, jumlahPinjaman: jumlahPinjaman, tenor: tenor)
        
        //Update agunan atribut
        coreDataVM.updateAgunan(agunan: newPinjaman.agunan!, nama: namaBarang, harga: hargaBarang, nomorSeri: nomorSeri, tipeBarang: tipeBarangAgunan, warna: warnaBarang)
        
        mainPageVM.fillAllAgreement()
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

