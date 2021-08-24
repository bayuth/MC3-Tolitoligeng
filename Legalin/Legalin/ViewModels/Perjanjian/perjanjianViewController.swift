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
	@Published var pihak1NIK: String = ""
	@Published var pihak1Nama: String = ""
	@Published var pihak1TanggalLahir: Date = Date()
	@Published var pihak1Alamat: String = ""
	@Published var pihak1RT: String = ""
	@Published var pihak1RW: String = ""
	@Published var pihak1Kelurahan: String = ""
	@Published var pihak1Kecamatan: String = ""
	@Published var pihak1Kota: String = ""
	@Published var pihak1Provinsi: String = ""
	@Published var pihak1Pekerjaan: String = ""
	@Published var pihak1NomorHP: String = ""
	@Published var pihak1IsOpenCam: Bool = false
	
	//Step 2 attribute
	@Published var pihak2NIK: String = ""
	@Published var pihak2Nama: String = ""
	@Published var pihak2TanggalLahir: Date = Date()
	@Published var pihak2Alamat: String = ""
	@Published var pihak2RT: String = ""
	@Published var pihak2RW: String = ""
	@Published var pihak2Kelurahan: String = ""
	@Published var pihak2Kecamatan: String = ""
	@Published var pihak2Kota: String = ""
	@Published var pihak2Provinsi: String = ""
	@Published var pihak2Pekerjaan: String = ""
	@Published var pihak2NomorHP: String = ""
	@Published var pihak2NamaBank: String = ""
	@Published var pihak2NomorRekening: String = ""
	@Published var pihak2AtasNamaRekening: String = ""
	@Published var pihak2IsOpenCam: Bool = false
	@Published var modalPilihIdentitas: Bool = false
    
    //Step 3 attribute
    @Published var tujuanPeminjaman: String = ""
    
    @Published var jumlahPinjaman: Double = 0
    @Published var bunga: Double = 0
    @Published var tenor: Double = 0
    
    @Published var modalMetodePembayaran: Bool! = false
    @Published var metodePembayaran: String = "Metode Pembayaran"
    
    @Published var tanggalJatuhTempo: String = "Pilih Tanggal"
    
    @Published var modalPengadilanNegeri: Bool = false
    @Published var modalPilihKredit: Bool = false
    @Published var modalSimulasiKredit: Bool = false
    @Published var modalEmpty: Bool = false
    @Published var pengadilanNegeri: String = "Pilih"
    
    @Published var tanggalTandaTangan: String = "Pilih Tanggal"
    
    //Step 4 attribute
    @Published var modalAgunanState: Bool = false
    @Published var tipeBarangAgunan: String = "Detail"
    @Published var namaBarang: String = ""
    @Published var warnaBarang: String = ""
    @Published var hargaBarang: String = ""
    @Published var nomorSeri: String = ""
    
    //Validation
    @Published var nextButtonState : Bool = false
    @Published var page1State: Bool = false
    @Published var page2State: Bool = false
    @Published var page3State: Bool = false
    @Published var page4State: Bool = false
    
    @Published var redirectPage: String = "step1"
    
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
        pengadilanNegeri = "Pilih"
        
        tanggalTandaTangan = "Pilih Tanggal"
        
        //Step 4
        modalAgunanState = false
        tipeBarangAgunan = "Detail"
        namaBarang = ""
        warnaBarang = ""
        hargaBarang = ""
        nomorSeri = ""
        
        nextButtonState = false
        page1State = false
        page2State = false
        page3State = false
        page4State = false
        
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
    
    func syncPihak2(pihak2: Akun){
        
            pihak2NIK = pihak2.ktp?.nik ?? ""
            pihak2Nama = pihak2.ktp?.nama ?? ""
            pihak2TanggalLahir = pihak2.ktp?.tanggalLahir ?? Date()
            pihak2Alamat = pihak2.ktp?.alamat ?? ""
            pihak2RT = pihak2.ktp?.rt ?? ""
            pihak2RW = pihak2.ktp?.rw ?? ""
            pihak2Kelurahan = pihak2.ktp?.kelurahanDesa ?? ""
            pihak2Kecamatan = pihak2.ktp?.kecamatan ?? ""
            pihak2Kota = pihak2.ktp?.kotaKabupaten ?? ""
            pihak2Provinsi = pihak2.ktp?.provinsi ?? ""
            pihak2Pekerjaan = pihak2.pekerjaan ?? ""
            pihak2NomorHP = pihak2.nomorAktif ?? ""
    }
        
    func detailSync(pinjaman: Pinjaman){
        
        //Step 1
        pihak1NIK = pinjaman.pihak1?.ktp?.nik ?? ""
        pihak1Nama = pinjaman.pihak1?.ktp?.nama ?? ""
        pihak1TanggalLahir = pinjaman.pihak1?.ktp?.tanggalLahir ?? Date()
        pihak1Alamat = pinjaman.pihak1?.ktp?.alamat ?? ""
        pihak1RT = pinjaman.pihak1?.ktp?.rt ?? ""
        pihak1RW = pinjaman.pihak1?.ktp?.rw ?? ""
        pihak1Kelurahan = pinjaman.pihak1?.ktp?.kelurahanDesa ?? ""
        pihak1Kecamatan = pinjaman.pihak1?.ktp?.kecamatan ?? ""
        pihak1Kota = pinjaman.pihak1?.ktp?.kotaKabupaten ?? ""
        pihak1Provinsi = pinjaman.pihak1?.ktp?.provinsi ?? ""
        pihak1Pekerjaan = pinjaman.pihak1?.pekerjaan ?? ""
        pihak1NomorHP = pinjaman.pihak1?.nomorAktif ?? ""
        
        print("Masuk detail sync")
        //Step 2
        pihak2Nama = pinjaman.pihak2?.ktp?.nama ?? ""
        pihak2TanggalLahir = pinjaman.pihak2?.ktp?.tanggalLahir ?? Date()
        pihak2Alamat = pinjaman.pihak2?.ktp?.alamat ?? ""
        pihak2RT = pinjaman.pihak2?.ktp?.rt ?? ""
        pihak2RW = pinjaman.pihak2?.ktp?.rw ?? ""
        pihak2Kelurahan = pinjaman.pihak2?.ktp?.kelurahanDesa ?? ""
        pihak2Kecamatan = pinjaman.pihak2?.ktp?.kecamatan ?? ""
        pihak2Kota = pinjaman.pihak2?.ktp?.kotaKabupaten ?? ""
        pihak2Provinsi = pinjaman.pihak2?.ktp?.provinsi ?? ""
        pihak2Pekerjaan = pinjaman.pihak2?.pekerjaan ?? ""
        pihak2NomorHP = pinjaman.pihak2?.nomorAktif ?? ""
        pihak2NamaBank = pinjaman.pihak2?.namaBank ?? ""
        pihak2NomorRekening = pinjaman.pihak2?.nomorRekening ?? ""
        pihak2AtasNamaRekening = pinjaman.pihak2?.atasNamaRekening ?? ""
        
        //Step 3
        tujuanPeminjaman = pinjaman.kredit?.namaSimulasi ?? ""
        jumlahPinjaman = pinjaman.kredit?.jumlahPinjaman ?? 0
        bunga = pinjaman.kredit?.bunga ?? 0
        tenor = pinjaman.kredit?.tenor ?? 0
        
        modalMetodePembayaran = false
        metodePembayaran = pinjaman.metodePembayaran ?? ""
        
        tanggalJatuhTempo = pinjaman.jatuhTempo ?? ""
        
        modalPengadilanNegeri = false
        pengadilanNegeri = pinjaman.pengadilanNegeri ?? ""
        
        tanggalTandaTangan = pinjaman.tanggalTandaTangan ?? ""
        
        //Step 4
        modalAgunanState = false
        tipeBarangAgunan = pinjaman.agunan?.tipeBarang ?? ""
        namaBarang = pinjaman.agunan?.nama ?? ""
        warnaBarang = pinjaman.agunan?.warna ?? ""
        hargaBarang = pinjaman.agunan?.harga ?? ""
        nomorSeri = pinjaman.agunan?.nomorSeri ?? ""

    }
    
    
    func checkEmptyString(item: String) -> Bool{
        if (item == ""){
            return false
        } else {
            return true
        }
    }
    
    func checkEmptyDouble(item: Double) -> Bool{
        if (item == 0){
            return false
        } else {
            return true
        }
    }
    
    func setRedirectPage(){
        
        var selected = false
        
        if (page1State == false){
            redirectPage = "step1"
            selected = true
        }
        
        if(page2State == false) && (selected == false){
            redirectPage = "step2"
            selected = true
        }
        
        if(page3State == false) && (selected == false){
            redirectPage = "step3"
            selected = true
        }
        
        if (page4State == false) && (selected == false){
            redirectPage = "step4"
        }
    }
    
    func setNextButtonState() {
        
        nextButtonState = true
        
        page1State = checkStep1()
        page2State = checkStep2()
        page3State = checkStep3()
        page4State = checkStep4()
        
        if page1State == false {
            nextButtonState = false
        }
        
        if page2State == false {
            nextButtonState = false
        }
        
        if page3State == false{
            nextButtonState = false
        }
        
        if page4State == false{
            nextButtonState = false
        }
        
        setRedirectPage()
    }
    
    func checkStep1() -> Bool {
        
        var result = true
        
        result = checkEmptyString(item: pihak1NIK)
        result = checkEmptyString(item: pihak1Nama)
        result = checkEmptyString(item: pihak1Alamat)
        result = checkEmptyString(item: pihak1RT)
        result = checkEmptyString(item: pihak1RW)
        result = checkEmptyString(item: pihak1Kelurahan)
        result = checkEmptyString(item: pihak1Kecamatan)
        result = checkEmptyString(item: pihak1Kota)
        result = checkEmptyString(item: pihak1Provinsi)
        result = checkEmptyString(item: pihak1Pekerjaan)
        result = checkEmptyString(item: pihak1NomorHP)
        
        return result
    }
    
    func checkStep2() -> Bool {
        
        var result = true
        
        result = checkEmptyString(item: pihak2NIK)
        result = checkEmptyString(item: pihak2Nama)
        result = checkEmptyString(item: pihak2Alamat)
        result = checkEmptyString(item: pihak2RT)
        result = checkEmptyString(item: pihak2RW)
        result = checkEmptyString(item: pihak2Kelurahan)
        result = checkEmptyString(item: pihak2Kecamatan)
        result = checkEmptyString(item: pihak2Kota)
        result = checkEmptyString(item: pihak2Provinsi)
        result = checkEmptyString(item: pihak2Pekerjaan)
        result = checkEmptyString(item: pihak2NomorHP)
        result = checkEmptyString(item: pihak2NamaBank)
        result = checkEmptyString(item: pihak2NomorRekening)
        result = checkEmptyString(item: pihak2AtasNamaRekening)
        
        return result
    }
    
    func checkStep3() -> Bool {
        
        var result = true
        
        result = checkEmptyString(item: tujuanPeminjaman)
        result = checkEmptyDouble(item: jumlahPinjaman)
        result = checkEmptyDouble(item: tenor)

        if (metodePembayaran == "Metode Pembayaran"){
            result = false
        }

        if (tanggalJatuhTempo == "Pilih Tanggal"){
            result = false
        }

        if (pengadilanNegeri == "Pengadilan Negeri"){
            result = false
        }

        if (tanggalTandaTangan == "Pilih Tanggal"){
            result = false
        }
        
        return result
    }
    
    func checkStep4() -> Bool {
        
        var result = true
        
                if (modalAgunanState == true){
        
                    if (tipeBarangAgunan == "Detail"){
                        result = false
                    }
        
                    result = checkEmptyString(item: namaBarang)
                    result = checkEmptyString(item: warnaBarang)
                    result = checkEmptyString(item: hargaBarang)
        
                    if (tipeBarangAgunan == "Elektronik"){
                        result = checkEmptyString(item: nomorSeri)
                    }
        
                }
        
        return result
    }
    
	func setPihak1OpenCamToFalse(isOpenCam:Bool){
		pihak1IsOpenCam = isOpenCam
	}
    
	func setPihak2OpenCamToFalse(isOpenCam:Bool){
		pihak2IsOpenCam = isOpenCam
	}
	
	func updatePihak1KTP(nik: String, nama: String, tanggalLahir: Date, alamat: String, RT:String, RW: String, kelurahan: String, kecamatan: String, kota: String, provinsi: String, isOpenCam:Bool){
        
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
		pihak1IsOpenCam = isOpenCam
    }
	
    func updatePihak1NonKTP( pekerjaan: String ,nomorHP: String){
        pihak1Pekerjaan = pekerjaan ?? ""
        pihak1NomorHP = nomorHP ?? ""
    }
    
	func updatePihak2KTP(nik: String, nama: String, tanggalLahir: Date, alamat: String, RT:String, RW: String, kelurahan: String, kecamatan: String, kota: String, provinsi: String, isOpenCam:Bool){
        
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
        pihak2IsOpenCam = isOpenCam
    }
    
    func updatePihak2NonKTP(pekerjaan: String, nomorHP : String ,namaBank: String, nomorRekening : String, atasNamaRekening : String){
        pihak2Pekerjaan = pekerjaan ?? ""
        pihak2NomorHP = nomorHP ?? ""
        pihak2NamaBank = namaBank ?? ""
        pihak2NomorRekening = nomorRekening ?? ""
        pihak2AtasNamaRekening = atasNamaRekening ?? ""
    }
    
    func updatePinjamanCoreData(status: StatusSurat){
        
        var newPinjaman = coreDataVM.createPinjaman()
        //Update pinjaman atribut
        coreDataVM.updatePinjaman(pinjaman: newPinjaman, tujuan: tujuanPeminjaman, metodePembayaran: metodePembayaran, jatuhTempo: tanggalJatuhTempo, pengadilanNegeri: pengadilanNegeri, tanggalTandaTangan: tanggalTandaTangan, status: status)
        
        //Update pihak1 atribut
        coreDataVM.updateAkun(akun: newPinjaman.pihak1! , NIK: pihak1NIK, nama: pihak1Nama, tanggalLahir: pihak1TanggalLahir, alamat: pihak1Alamat, rt: pihak1RT, rw: pihak1RW, kecamatan: pihak1Kecamatan, kelurahanDesa: pihak1Kelurahan, kotaKabupaten: pihak1Kota, provinsi: pihak1Provinsi, pekerjaan: pihak1Pekerjaan, nomorAktif: pihak1NomorHP)
        
        //Update pihak2 atribut
        coreDataVM.updateAkun(akun: newPinjaman.pihak2! , NIK: pihak2NIK, nama: pihak2Nama, tanggalLahir: pihak2TanggalLahir, alamat: pihak2Alamat, rt: pihak2RT, rw: pihak2RW, kecamatan: pihak2Kecamatan, kelurahanDesa: pihak2Kelurahan, kotaKabupaten: pihak2Kota, provinsi: pihak2Provinsi, pekerjaan: pihak2Pekerjaan, nomorAktif: pihak2NomorHP, namaBank: pihak2NamaBank, nomorRekening: pihak2NomorRekening, atasNamaRekening: pihak2AtasNamaRekening)
        
        //Update kredit atribut
        coreDataVM.updateKredit(kredit: newPinjaman.kredit!, nama: tujuanPeminjaman, bunga: bunga, jumlahPinjaman: jumlahPinjaman, tenor: tenor)
        
        //Update agunan atribut
        coreDataVM.updateAgunan(agunan: newPinjaman.agunan!, nama: namaBarang, harga: hargaBarang, nomorSeri: nomorSeri, tipeBarang: tipeBarangAgunan, warna: warnaBarang)
        
        mainPageVM.fillAllAgreement()
    }
    
    
    func deletePinjaman(pinjaman:Pinjaman){
        if pinjaman != nil{
            coreDataVM.deletePinjaman(pinjaman: pinjaman)
            mainPageVM.fillAllAgreement()
        }
        
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
    
    func convertNumToWord(bil: Int) -> String {
        
            let angka = ["","Satu","Dua","Tiga","Empat","Lima","Enam",
                     "Tujuh","Delapan","Sembilan","Sepuluh","Sebelas"]
            var Hasil = " "
        
            let n = bil
        
        if (n >= 0 && n <= 11){
                Hasil = angka[n]
        }
            else if (n < 20){
                Hasil = convertNumToWord(bil: n-10) + " Belas "
        }
            else if (n < 100){
                Hasil = convertNumToWord(bil: n/10) + " Puluh " + convertNumToWord(bil: n%10)
            }   else if n < 200 {
                Hasil = " Seratus " + convertNumToWord(bil: (n-100))}
            else if n < 1000 {
                Hasil = convertNumToWord(bil: n/100) + " Ratus " + convertNumToWord(bil: n%100)}
            else if n < 2000{
                Hasil = " Seribu " + convertNumToWord(bil: n-1000)}
            else if n < 1000000{
                Hasil = convertNumToWord(bil: n/1000) + " Ribu " + convertNumToWord(bil: n%1000)}
            else if n < 1000000000{
                Hasil = convertNumToWord(bil: n/1000000) + " Juta " + convertNumToWord(bil: (n%1000000))}
            else if n < 1000000000000{
                Hasil = convertNumToWord(bil: (n/1000000000))  + " Milyar " + convertNumToWord(bil: (n%1000000000)) }
            else if n < 1000000000000000{
                Hasil = convertNumToWord(bil: (n/1000000000000)) + " Triliyun " + convertNumToWord(bil: (n%1000000000000))}
            else if n == 1000000000000000{
                Hasil = "Satu Kuadriliun"
            }
            else{
                Hasil = "Angka Hanya Sampai Satu Kuadriliun"}

            return Hasil
        
    }
    
    func generateListString() -> [String] {
        let intArray: [Int] = Array(1...28)
        var resultArray :[String] = []
        intArray.forEach{
            resultArray.append("\($0)")
        }
        return resultArray
    }
}

