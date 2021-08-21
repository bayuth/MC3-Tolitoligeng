//
//  functionTrimKtp.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 05/08/21.
//

import SwiftUI

class functionTrimKtp: ObservableObject {
	
    var selectedPihak:Int
	@Published var showScannerSheet = false
//	@Published var texts:[ScanData] = []
	@Published var ktpInfo:ScanDataClass = ScanDataClass()
    
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    @ObservedObject var profileController: ProfileController = .shared
//	@Published var ktpInfo:[ScanDataClass] = []
    
    init(pihak:Int){
        selectedPihak = pihak
    }
	
	func makeScannerView() -> ScannerView {
		
		ScannerView(completion: {
			textPerPage in
			if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
				
//				print(outputText)
				
				let nikFromKtp = outputText.slice(from: "NIK", to: "Nama")
				print(nikFromKtp)
				var namaFromKtp = outputText.slice(from: "Nama", to:"Tempat")
				if namaFromKtp?.contains(": ") == true{
					namaFromKtp = namaFromKtp!.components(separatedBy: ": ").joined(separator: "")
					print(namaFromKtp)
				} else if namaFromKtp?.contains(":") == true{
					namaFromKtp = namaFromKtp!.components(separatedBy: ":").joined(separator: "")
					print(namaFromKtp)
				} else if namaFromKtp?.contains(" ") == true{
					namaFromKtp = namaFromKtp!.components(separatedBy: " ").joined(separator: "")
					print(namaFromKtp)
				}
				else {
					namaFromKtp = outputText.slice(from: "Nama", to: "Tempat")
					print(namaFromKtp)
				}
				
				let alamatFromKtp = outputText.slice(from: "Alamat", to: "RT")
				print(alamatFromKtp)
				
				var rtRwFromKtp = outputText.slice(from: "RT/RW", to: "Kel")
				var rtBersih = ""
				var rwBersih = ""
				if rtRwFromKtp?.contains(": ") == true {
					rtRwFromKtp = outputText.components(separatedBy: ": ").joined(separator: "")
					print(rtRwFromKtp)
					if let rtIndex = rtRwFromKtp?.firstIndex(of: "/") {
						let rt = rtRwFromKtp!.prefix(upTo: rtIndex)
						rtBersih = String(rt)
						print(rtBersih)
					}
					if let rwIndex = rtRwFromKtp?.range(of: "/") {
						let rw = rtRwFromKtp?[rwIndex.upperBound...].trimmingCharacters(in: .whitespaces)
						rwBersih = rw ?? ""
						print(rwBersih)
					}
					
				}
				if rtRwFromKtp?.contains(":") == true {
					rtRwFromKtp = outputText.components(separatedBy: ":").joined(separator: "")
					print(rtRwFromKtp)
					if let rtIndex = rtRwFromKtp?.firstIndex(of: "/") {
						let rt = rtRwFromKtp!.prefix(upTo: rtIndex)
						rtBersih = String(rt)
						print(rtBersih)
					}
					if let rwIndex = rtRwFromKtp?.range(of: "/") {
						let rw = rtRwFromKtp![rwIndex.upperBound...].trimmingCharacters(in: .whitespaces)
						rwBersih = rw
						print(rwBersih)
					}
				}
				if rtRwFromKtp?.contains(" ") == true {
					rtRwFromKtp = outputText.components(separatedBy: " ").joined(separator: "")
					print(rtRwFromKtp)
					if let rtIndex = rtRwFromKtp?.firstIndex(of: "/") {
						let rt = rtRwFromKtp!.prefix(upTo: rtIndex)
						rtBersih = String(rt)
						print(rtBersih)
					}
					if let rwIndex = rtRwFromKtp!.range(of: "/") {
						let rw = rtRwFromKtp![rwIndex.upperBound...].trimmingCharacters(in: .whitespaces)
						rwBersih = rw
						print(rwBersih)
					}
				}
				else {
					rtRwFromKtp = outputText.slice(from: "RT/RW", to: "Kel")
					print(rtRwFromKtp)
					if let rtIndex = rtRwFromKtp?.firstIndex(of: "/") {
						let rt = rtRwFromKtp!.prefix(upTo: rtIndex)
						rtBersih = String(rt)
						print(rtBersih)
					}
					if let rwIndex = rtRwFromKtp?.range(of: "/") {
						let rw = rtRwFromKtp![rwIndex.upperBound...].trimmingCharacters(in: .whitespaces)
						rwBersih = rw
						print(rwBersih)
					}
					
				}
				let kelurahanFromKtp = outputText.slice(from: "Kel/Desa", to: "Kecamatan")
				print(kelurahanFromKtp)
				let kecamatanFromKtp = outputText.slice(from: "Kecamatan", to: "Agama")
				print(kecamatanFromKtp)
//				GET KOTA
				var kotaFromKtp = outputText.slice(from: "KOTA", to: "NIK")
				print(kotaFromKtp ?? "")
				if kotaFromKtp == "" {
					kotaFromKtp = outputText.slice(from: "JAKARTA", to: "NIK")
					print(kotaFromKtp ?? "")
					if kotaFromKtp == "" {
						kotaFromKtp = outputText.slice(from: "KABUPATEN", to: "NIK")
						print(kotaFromKtp ?? "")
					}
				}
//				GET PROVINSI
				let provinsiFromKtp = outputText.slice(from: "PROVINSI", to: "KOTA")
				if provinsiFromKtp == "" {
					var provinsiFromKtp = outputText.slice(from: "PROVINSI", to: "KABUPATEN")
					print(provinsiFromKtp)
					if provinsiFromKtp == "" {
						provinsiFromKtp = outputText.slice(from: "PROVINSI", to: "JAKARTA")
						print(provinsiFromKtp)
					}
				}
				
				print(provinsiFromKtp)
				
				var tanggalLahir = outputText.slice(from: " Lahir", to: "Jenis")
				var tanggalBersih = ""
				print(tanggalLahir ?? "Cannot get birth date from scan")
				if tanggalLahir?.isEmpty == true {
					tanggalLahir = outputText.slice(from: " Lahir", to: "Jens")
					print(tanggalLahir)
				}
				if tanggalLahir?.contains(",") == true{
					if let tanggalLahirIndex = tanggalLahir?.range(of: ","){
						let tanggal = tanggalLahir![tanggalLahirIndex.upperBound...].trimmingCharacters(in: .whitespaces)
						tanggalBersih = tanggal
						print(tanggalBersih)
					}
				} else if tanggalLahir?.contains(".") == true{
					if let tanggalLahirIndex = tanggalLahir?.range(of: "."){
						let tanggal = tanggalLahir![tanggalLahirIndex.upperBound...].trimmingCharacters(in: .whitespaces)
						tanggalBersih = tanggal
						print(tanggalBersih)
					}
				}
				
				let dateFormatter = DateFormatter()
//				dateFormatter.locale = Locale(identifier: "id")
//				dateFormatter.timeZone = TimeZone.current
				dateFormatter.dateFormat = "dd-MM-yyyy"
				let date = dateFormatter.date(from: tanggalBersih)
				print(date ?? "cannot convert date")
//				let pekerjaanFromKtp = outputText.slice(from: "Pekerjaan", to: "Kewarganegaraan")
//				print(pekerjaanFromKtp)
				
//				let newKtpInfo = ScanDataClass()
				self.ktpInfo.updateData(nama: namaFromKtp ?? "", nik: nikFromKtp ?? "", tanggalLahir: date ?? Date() ,alamat: alamatFromKtp ?? "", Rt: rtBersih , Rw: rwBersih , kelurahan: kelurahanFromKtp ?? "", kecamatan: kecamatanFromKtp ?? "", kota: kotaFromKtp ?? "", provinsi: provinsiFromKtp ?? "", pekerjaan: "", nomorHp: "", namaBank: "", nomorRekening: "", atasNamaRekening: "")
                
                if(self.selectedPihak == 0){
					self.profileController.updatePihak1KTP(nik: nikFromKtp ?? "", nama: namaFromKtp ?? "", tanggalLahir: date ?? Date(), alamat: alamatFromKtp ?? "", RT: rtBersih, RW: rwBersih, kelurahan: kelurahanFromKtp ?? "", kecamatan: kecamatanFromKtp ?? "", kota: kotaFromKtp ?? "", provinsi: provinsiFromKtp ?? "")
                }
                
                if(self.selectedPihak == 1){
					self.perjanjianController.updatePihak1KTP(nik: nikFromKtp ?? "", nama: namaFromKtp ?? "", tanggalLahir: date ?? Date(), alamat: alamatFromKtp ?? "", RT: rtBersih, RW: rwBersih, kelurahan: kelurahanFromKtp ?? "", kecamatan: kecamatanFromKtp ?? "", kota: kotaFromKtp ?? "", provinsi: provinsiFromKtp ?? "")
                }
                
                if(self.selectedPihak == 2){
					self.perjanjianController.updatePihak2KTP(nik: nikFromKtp ?? "", nama: namaFromKtp ?? "", tanggalLahir: date ?? Date(), alamat: alamatFromKtp ?? "", RT: rtBersih, RW: rwBersih, kelurahan: kelurahanFromKtp ?? "", kecamatan: kecamatanFromKtp ?? "", kota: kotaFromKtp ?? "", provinsi: provinsiFromKtp ?? "")
                }
                //Update to controller
                
                
//				self.ktpInfo = newKtpInfo
//				print(self.ktpInfo.nama)
//				print(self.ktpInfo[0].nama)
				
//				let newScanData = ScanData(content: outputText, nama: namaFromKtp, nik:nikFromKtp, alamat:alamatFromKtp, RtRw:rtRwFromKtp, kelurahan:kelurahanFromKtp, kecamatan:kecamatanFromKtp, kota:kotaFromKtp, provinsi:provinsiFromKtp)
//				self.texts.append(newScanData)
			}
			self.showScannerSheet = false
		})
	}
	
}


extension String {
	
func slice(from: String, to: String) -> String? {

	return (range(of: from)?.upperBound).flatMap { substringFrom in
		(range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
			String(self[substringFrom..<substringTo].trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}
}
