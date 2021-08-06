//
//  CoreDataRelationshipViewModel.swift
//  Legalin
//
//  Created by Jason Hartanto on 30/07/21.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    //Data yang akan digunakan di view model
    //Bisa liat di views, folder TestCoreDataView untuk contoh penggunaan
    //Data harusnya sudah otomatis terupdate di view kalau ada perubahan, sudah menerapkan observable object
    //khusus buat pihak1, pihak1 yang diambil adalah profil user. cara ambilnya pihak1[0]
    //Dibuat dengan tutorial https://www.youtube.com/watch?v=huRKU-TAD3g&t=1846s
    
    @Published var pihak1:[Akun] = []
    @Published var listPihak2:[Akun] = []
    @Published var listPinjaman:[Pinjaman] = []
    @Published var listKredit:[Kredit] = []
    
    init(){
        getPihak1()
        getAllPihak2()
        getAllPinjaman()
        getAllKredit()
    }
    
    let manager = CoreData.instance
    
    //Create Entity KTP untuk akun
    func createKTP() -> KTP{
        
        let newKTP = KTP(context: manager.context)
        
        newKTP.uuid = UUID()
        
        return newKTP
    }
    
//    Digunakan untuk initialize profil awal atau pihak 1
//    Set false kalau pihak bukan yang ada di perjanjian, hanya di profile
    func createPihak1(pinjamanPage: Bool) -> Akun?{

        var tempAkun:Akun
        //Check if existing profile already made
        if (pihak1 != []){

            print("Profile alread exist")
            tempAkun = pihak1[0]

        } else {

            let newAkun = Akun(context: manager.context)

            //Genereate UUID and Date
            newAkun.uuid = UUID()
            newAkun.dateCreated = Date()
            newAkun.dateModified = Date()
            newAkun.profileSelected = true
            newAkun.pinjamanPage = pinjamanPage
            newAkun.ktp = createKTP()
            save()

            if (pinjamanPage == false){
                getPihak1()
            } else {
                getAllPinjaman()
            }
            
            tempAkun = newAkun
        }

        return tempAkun
    }
    
    //Digunakan untuk initialize pihak 2
    //Set false kalau pihak bukan yang ada di perjanjian, hanya untuk template
    func createPihak2(pinjamanPage: Bool) -> Akun{
        //Genereate UUID and Date
        let newAkun = Akun(context: manager.context)
        
        newAkun.uuid = UUID()
        newAkun.dateCreated = Date()
        newAkun.dateModified = Date()
        newAkun.profileSelected = false
        newAkun.pinjamanPage = pinjamanPage
        newAkun.ktp = createKTP()
        
        save()
        
        getAllPinjaman()
        getAllPihak2()
        
        return newAkun
    }
    
    func assignPihakToPinjamanPage(pihakOriginal: Akun, pihakCopy: Akun){
        
        //Update Modified Data
        pihakCopy.dateModified = Date()
        
        if (pihakOriginal.profileSelected == pihakCopy.profileSelected)  {
            
            //Copy Akun Attribute
            pihakCopy.nomorAktif = pihakOriginal.nomorAktif
            pihakCopy.pekerjaan = pihakOriginal.pekerjaan
            pihakCopy.namaBank = pihakOriginal.namaBank
            pihakCopy.atasNamaRekening = pihakOriginal.atasNamaRekening
            pihakCopy.nomorRekening = pihakOriginal.nomorRekening
            
            //Copy KTP Attribute
            pihakCopy.ktp?.image = pihakOriginal.ktp?.image
            pihakCopy.ktp?.nama = pihakOriginal.ktp?.nama
            pihakCopy.ktp?.nik = pihakOriginal.ktp?.nik
            pihakCopy.ktp?.tanggalLahir = pihakOriginal.ktp?.tanggalLahir
            
            pihakCopy.ktp?.alamat = pihakOriginal.ktp?.alamat
            pihakCopy.ktp?.rt = pihakOriginal.ktp?.rt
            pihakCopy.ktp?.rw = pihakOriginal.ktp?.rw
            pihakCopy.ktp?.kecamatan = pihakOriginal.ktp?.kecamatan
            pihakCopy.ktp?.kelurahanDesa = pihakOriginal.ktp?.kelurahanDesa
            pihakCopy.ktp?.kotaKabupaten = pihakOriginal.ktp?.kotaKabupaten
            pihakCopy.ktp?.provinsi = pihakOriginal.ktp?.provinsi
            
            save()
            getAllPinjaman()
            
        } else{
            print("Unable to copy because of different account type")
        }
    }
    
    //Dapatkan pihak1 atau profil
    func getPihak1() {
        let request = NSFetchRequest<Akun>(entityName: "Akun")
        
        let predicateProfile = NSPredicate(format: "profileSelected == %@", NSNumber(value: true))
        let predicatePinjamanPage = NSPredicate(format: "pinjamanPage == %@", NSNumber(value: false))
        let andPredicate = NSCompoundPredicate(type: .and, subpredicates: [predicateProfile, predicatePinjamanPage])
        request.predicate = andPredicate
        
//        request.predicate = predicateProfile
        
        do{
            pihak1 = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    //Dapatkan list pihak2 untuk template
    func getAllPihak2(){
        let request = NSFetchRequest<Akun>(entityName: "Akun")
        
        let sort = NSSortDescriptor(keyPath: \Akun.dateCreated, ascending: true)
        request.sortDescriptors = [sort]
        
        let predicateProfile = NSPredicate(format: "profileSelected == %@", NSNumber(value: false))
        let predicatePinjamanPage = NSPredicate(format: "pinjamanPage == %@", NSNumber(value: false))
        let andPredicate = NSCompoundPredicate(type: .and, subpredicates: [predicateProfile, predicatePinjamanPage])
        request.predicate = andPredicate
        
        do{
            listPihak2 = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    //Mengganti isi akun
    func updateAkun(akun: Akun, ktpImage: Data? = nil, NIK: String? = nil, nama: String? = nil, tanggalLahir: Date? = nil, alamat: String? = nil, rt: String? = nil, rw: String? = nil, kecamatan:String? = nil, kelurahanDesa:String? = nil, kotaKabupaten:String? = nil, provinsi:String? = nil, pekerjaan: String? = nil, nomorAktif: String? = nil, namaBank: String? = nil, nomorRekening:String? = nil, atasNamaRekening: String? = nil) {
        
        //Update modified date
        akun.dateModified = Date()
        
//        Update pihak 1 & 2 attribute
        
//        Atribut KTP
        akun.ktp?.image =  ktpImage
        akun.ktp?.nik = NIK
        akun.ktp?.nama = nama
        akun.ktp?.tanggalLahir = tanggalLahir
        
        akun.ktp?.alamat = alamat
        akun.ktp?.rt = rt
        akun.ktp?.rw = rw
        akun.ktp?.kecamatan = kecamatan
        akun.ktp?.kelurahanDesa = kelurahanDesa
        akun.ktp?.kotaKabupaten = kotaKabupaten
        akun.ktp?.provinsi = provinsi
    
//        Atribut nonKTP
        akun.pekerjaan = pekerjaan
        akun.nomorAktif = nomorAktif
        
        //Input pihak 2 attribute
        akun.namaBank = namaBank
        akun.nomorRekening = nomorRekening
        akun.atasNamaRekening = atasNamaRekening
        
        save()
        
        if ((akun.profileSelected == true) && (akun.pinjamanPage == false)){
            getPihak1()
        } else {
            getAllPinjaman()
            getAllPihak2()
        }
    }
    
    //Hapus akun. akun yang sedang posisi profil tidak dapat dihapus
    func deleteAkun(pihak: Akun){
        
        if (pihak.profileSelected == false) {
            manager.context.delete(pihak)
            save()
            
            getAllPinjaman()
            getAllPihak2()
        } else {
            print("Can't delete profile account")
        }
    }
    
    //Membuat agunan
    func createAgunan() -> Agunan{
        
        let newAgunan = Agunan(context: manager.context)
        
        //Generate UUID dan Date
        newAgunan.uuid = UUID()
        newAgunan.dateCreated = Date()
        newAgunan.dateModified = Date()
        
        save()
        getAllPinjaman()
        return newAgunan
    }
    
    //Update agunan
    func updateAgunan(agunan: Agunan, nama: String? = nil, harga: Int? = nil, nomorSeri:String? = nil, tipeBarang: String? = nil, warna: String? = nil){
        
        //Update modified date
        agunan.dateModified = Date()
        
        //Generate Agunan Attribute
        agunan.nama = nama
        agunan.harga = Int64(harga ?? 0)
        agunan.nomorSeri = nomorSeri
        agunan.tipeBarang = tipeBarang
        agunan.warna = warna
        
        save()
        getAllPinjaman()
    }
    
    //Mendapatkan seluruh agunan
    func getAllAgunan()->[Agunan]{
        let request = NSFetchRequest<Agunan>(entityName: "Agunan")
        
        let sort = NSSortDescriptor(keyPath: \Agunan.dateCreated, ascending: true)
        request.sortDescriptors = [sort]
        
        var listAgunan:[Agunan] = []
        
        do{
            listAgunan = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
        
        return listAgunan
    }
    
    //Hapus agunan bersangkutan
    func deleteAgunan(agunan:Agunan){
        manager.context.delete(agunan)
        save()
        getAllPinjaman()
    }
    
    //Membuat kredit, pinjamanPage false kalau buat page kredit, bukan di perjanjian
    func createKredit(pinjamanPage: Bool) -> Kredit{
        
        let newKredit = Kredit(context: manager.context)
        
        //Generate UUID dan Date
        newKredit.uuid = UUID()
        newKredit.dateCreated = Date()
        newKredit.dateModified = Date()
        newKredit.pinjamanPage = pinjamanPage
        
        save()
        getAllKredit()
        
        return newKredit
    }
    
    //Update atribut dari kredit
    func updateKredit(kredit: Kredit, nama: String? = nil, bunga: Int? = nil, jumlahPinjaman: Int? = nil, tenor: Int? = nil){
        
        //Change modified date
        kredit.dateModified = Date()
        
        //Generate Credit attribute
        kredit.namaSimulasi = nama
        kredit.bunga = Int64(bunga ?? 0)
        kredit.jumlahPinjaman = Int64(jumlahPinjaman ?? 0)
        kredit.tenor = Int64(tenor ?? 0)
        
        save()
        getAllKredit()
    }
    
    //Mengambil semua kredit yang ditampilkan di page simulasi kredit
    func getAllKredit(){
        let request = NSFetchRequest<Kredit>(entityName: "Kredit")
        
        let sort = NSSortDescriptor(keyPath: \Kredit.dateCreated, ascending: true)
        request.sortDescriptors = [sort]
        
        let predicatePinjamanPage = NSPredicate(format: "pinjamanPage == %@", NSNumber(value: false))
        request.predicate = predicatePinjamanPage
        
        do{
            listKredit = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    //Memindahkan data dari page simulasi kredit ke pinjaman
    func assignKreditToPinjamanPage(kreditOriginal: Kredit, kreditCopy: Kredit) {
        
        kreditCopy.dateModified = Date()
        
        kreditCopy.namaSimulasi = kreditOriginal.namaSimulasi
        kreditCopy.bunga = kreditOriginal.bunga
        kreditCopy.jumlahPinjaman = kreditOriginal.jumlahPinjaman
        kreditCopy.tenor = kreditOriginal.tenor
        
        save()
        getAllKredit()
        getAllPinjaman()
    }
    
    //Menghapus kredit yang dipilih
    func deleteKredit(kredit: Kredit) {
        manager.context.delete(kredit)
        save()
        
        getAllPinjaman()
        getAllKredit()
    }
    
//    Membuat pinjaman baru
    func createPinjaman() -> Pinjaman{

        let newPinjaman = Pinjaman(context: manager.context)

        //Generate UUID dan Date
        newPinjaman.uuid = UUID()
        newPinjaman.dateCreated = Date()
        newPinjaman.dateModified = Date()

        //Init Status dan Reminder
        newPinjaman.status = StatusSurat.draft.rawValue
        newPinjaman.reminder = false

        //Buat pihak1 di page pinjaman (loaner)
        newPinjaman.pihak1 = createPihak1(pinjamanPage: true)

        //Buat profil2 di pinjaman page (lender)
        newPinjaman.pihak2 = createPihak2(pinjamanPage: true)

        //Buat kredit di pinjaman page
        newPinjaman.kredit = createKredit(pinjamanPage: true)

        //Buat agunan di pinjaman page
        newPinjaman.agunan = createAgunan()

        save()
        getAllPinjaman()

        return newPinjaman
    }
    
    //Update pinjaman sesuai atribut yang ada
    func updatePinjaman(pinjaman: Pinjaman, tujuan: String? = nil, metodePembayaran: String? = nil, jatuhTempo: Date? = nil, pengadilanNegeri: String? = nil, tanggalTandaTangan: Date? = nil, status: StatusSurat? = nil, reminder: Bool? = nil){
        
        //Generate Pinjaman attribute
        pinjaman.tujuan = tujuan
        pinjaman.metodePembayaran = tujuan
        pinjaman.jatuhTempo = jatuhTempo
        pinjaman.pengadilanNegeri = pengadilanNegeri
        pinjaman.tanggalTandaTangan = tanggalTandaTangan
        pinjaman.status = status?.rawValue
        pinjaman.reminder = reminder ?? false
        
        save()
        getAllPinjaman()
    }
    
    func getAllPinjaman(){
        let request = NSFetchRequest<Pinjaman>(entityName: "Pinjaman")
        
        let sort = NSSortDescriptor(keyPath: \Pinjaman.dateCreated, ascending: true)
        request.sortDescriptors = [sort]
        
        do{
            listPinjaman = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    //Hapus pinjaman yang dipilih beserta agunan yang bersangkutan
    func deletePinjaman(pinjaman: Pinjaman) {
        
        if let agunan = pinjaman.agunan {
            self.manager.context.delete(agunan)
        }
        
        if let kredit = pinjaman.kredit {
            self.manager.context.delete(kredit)
        }
        
        if let pihak1ktp = pinjaman.pihak1?.ktp {
            self.manager.context.delete(pihak1ktp)
        }
        
        if let pihak2ktp = pinjaman.pihak2?.ktp {
            self.manager.context.delete(pihak2ktp)
        }
        
        if let pihak1 = pinjaman.pihak1{
            self.manager.context.delete(pihak1)
        }
        
        if let pihak2 = pinjaman.pihak2{
            self.manager.context.delete(pihak2)
        }
        
        self.manager.context.delete(pinjaman)
        
        save()
        getAllPinjaman()
        
    }
    
    func save(){
        self.manager.save()
    }
    
}


