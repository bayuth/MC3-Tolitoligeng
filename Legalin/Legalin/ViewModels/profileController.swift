//
//  profileController.swift
//  Legalin
//
//  Created by Jason Hartanto on 13/08/21.
//

import Foundation

class ProfileController: ObservableObject{
    
    var coreDataVM: CoreDataViewModel = .shared
    
    static let shared = ProfileController()
    
    @Published var profil:[Akun] = []
    
    //Step 1 attribute
    @Published var pihak1NIK: String = ""
    @Published var pihak1Nama: String = ""
    @Published var pihak1TanggalLahir = Date()
    @Published var pihak1Alamat = ""
    @Published var pihak1RT = ""
    @Published var pihak1RW = ""
    @Published var pihak1Kelurahan = ""
    @Published var pihak1Kecamatan = ""
    @Published var pihak1Kota = ""
    @Published var pihak1Provinsi = ""
    @Published var pihak1Pekerjaan = ""
    @Published var pihak1NomorHP = ""
    
    init(){
        loadValue()
    }
    
    func loadValue(){
        profil = coreDataVM.pihak1
        
        if (profil.count != 0){
            pihak1NIK = profil[0].ktp?.nik ?? ""
            pihak1Nama = profil[0].ktp?.nama ?? ""
            pihak1TanggalLahir = Date()
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
    
    func updateProfileCoreData(){
        
        coreDataVM.updateAkun(akun: coreDataVM.createPihak1(pinjamanPage: false)!, NIK: pihak1NIK, nama: pihak1Nama, tanggalLahir: pihak1TanggalLahir, alamat: pihak1Alamat, rt: pihak1RT, rw: pihak1RW, kecamatan: pihak1Kecamatan, kelurahanDesa: pihak1Kelurahan, kotaKabupaten: pihak1Kota, provinsi: pihak1Provinsi, pekerjaan: pihak1Pekerjaan, nomorAktif: pihak1NomorHP)
        
    }
    
    func updatePihak1KTP(nik: String? = "", nama: String? = "", tanggalLahir: Date? = Date(), alamat: String? = "", RT:String? = "", RW: String? = "", kelurahan: String? = "", kecamatan: String? = "", kota: String? = "", provinsi: String? = ""){
        
        pihak1NIK = nik ?? ""
        pihak1Nama = nama ?? ""
        pihak1TanggalLahir = tanggalLahir ?? Date()
        pihak1Alamat = alamat ?? ""
        pihak1RT = RT ?? ""
        pihak1RW = RW ?? ""
        pihak1Kelurahan = kelurahan ?? ""
        pihak1Kecamatan = kecamatan ?? ""
        pihak1Kota = kota ?? ""
        pihak1Provinsi = provinsi ?? ""
    }
    
    
}
