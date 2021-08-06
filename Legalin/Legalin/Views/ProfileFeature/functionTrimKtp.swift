//
//  functionTrimKtp.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 05/08/21.
//

import SwiftUI

class functionTrimKtp: ObservableObject {
	
	@Published var showScannerSheet = false
//	@Published var texts:[ScanData] = []
	var ktpInfo:ScanDataClass = ScanDataClass()
//	@Published var ktpInfo:[ScanDataClass] = []
	
	func makeScannerView() -> ScannerView {
		ScannerView(completion: {
			textPerPage in
			if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
				
//				print(outputText)
				
				let nikFromKtp = outputText.slice(from: "NIK", to: "Nama")
				print(nikFromKtp)
				var namaFromKtp = outputText.slice(from: "Nama", to:"Tempat")
				if namaFromKtp.contains(": ") == true{
					namaFromKtp = namaFromKtp.components(separatedBy: ": ").joined(separator: "")
					print(namaFromKtp)
				} else if namaFromKtp.contains(":") == true{
					namaFromKtp = namaFromKtp.components(separatedBy: ":").joined(separator: "")
					print(namaFromKtp)
				} else if namaFromKtp.contains(" ") == true{
					namaFromKtp = namaFromKtp.components(separatedBy: " ").joined(separator: "")
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
				if rtRwFromKtp.contains(": ") == true {
					rtRwFromKtp = outputText.components(separatedBy: ": ").joined(separator: "")
					print(rtRwFromKtp)
					if let rtIndex = rtRwFromKtp.firstIndex(of: "/") {
						var rt = rtRwFromKtp.prefix(upTo: rtIndex)
						rtBersih = String(rt)
						print(rtBersih)
					}
					if let rwIndex = rtRwFromKtp.range(of: "/") {
						var rw = rtRwFromKtp[rwIndex.upperBound...].trimmingCharacters(in: .whitespaces)
						rwBersih = rw
						print(rwBersih)
					}
					
				}
				if rtRwFromKtp.contains(":") == true {
					rtRwFromKtp = outputText.components(separatedBy: ":").joined(separator: "")
					print(rtRwFromKtp)
					if let rtIndex = rtRwFromKtp.firstIndex(of: "/") {
						var rt = rtRwFromKtp.prefix(upTo: rtIndex)
						rtBersih = String(rt)
						print(rtBersih)
					}
					if let rwIndex = rtRwFromKtp.range(of: "/") {
						var rw = rtRwFromKtp[rwIndex.upperBound...].trimmingCharacters(in: .whitespaces)
						rwBersih = rw
						print(rwBersih)
					}
				}
				if rtRwFromKtp.contains(" ") == true {
					rtRwFromKtp = outputText.components(separatedBy: " ").joined(separator: "")
					print(rtRwFromKtp)
					if let rtIndex = rtRwFromKtp.firstIndex(of: "/") {
						var rt = rtRwFromKtp.prefix(upTo: rtIndex)
						rtBersih = String(rt)
						print(rtBersih)
					}
					if let rwIndex = rtRwFromKtp.range(of: "/") {
						var rw = rtRwFromKtp[rwIndex.upperBound...].trimmingCharacters(in: .whitespaces)
						rwBersih = rw
						print(rwBersih)
					}
				}
				else {
					rtRwFromKtp = outputText.slice(from: "RT/RW", to: "Kel")
					print(rtRwFromKtp)
					if let rtIndex = rtRwFromKtp.firstIndex(of: "/") {
						var rt = rtRwFromKtp.prefix(upTo: rtIndex)
						rtBersih = String(rt)
						print(rtBersih)
					}
					if let rwIndex = rtRwFromKtp.range(of: "/") {
						var rw = rtRwFromKtp[rwIndex.upperBound...].trimmingCharacters(in: .whitespaces)
						rwBersih = rw
						print(rwBersih)
					}
					
				}
				let kelurahanFromKtp = outputText.slice(from: "Kel/Desa", to: "Kecamatan")
				print(kelurahanFromKtp)
				let kecamatanFromKtp = outputText.slice(from: "Kecamatan", to: "Agama")
				print(kecamatanFromKtp)
				let kotaFromKtp = outputText.slice(from: "KOTA", to: "NIK")
				print(kotaFromKtp)
				let provinsiFromKtp = outputText.slice(from: "PROVINSI", to: "KOTA")
				print(provinsiFromKtp)
//				let pekerjaanFromKtp = outputText.slice(from: "Pekerjaan", to: "Kewarganegaraan")
//				print(pekerjaanFromKtp)
				
//				let newKtpInfo = ScanDataClass()
				self.ktpInfo.updateData(nama: namaFromKtp, nik: nikFromKtp, tanggalLahir: Date(), alamat: alamatFromKtp, Rt: rtBersih, Rw: rwBersih, kelurahan: kelurahanFromKtp, kecamatan: kecamatanFromKtp, kota: kotaFromKtp, provinsi: provinsiFromKtp, pekerjaan: "", nomorHp: "")
//				self.ktpInfo = newKtpInfo
				print(self.ktpInfo.nama)
//				print(self.ktpInfo[0].nama)
				
//				let newScanData = ScanData(content: outputText, nama: namaFromKtp, nik:nikFromKtp, alamat:alamatFromKtp, RtRw:rtRwFromKtp, kelurahan:kelurahanFromKtp, kecamatan:kecamatanFromKtp, kota:kotaFromKtp, provinsi:provinsiFromKtp)
//				self.texts.append(newScanData)
			}
			self.showScannerSheet = false
		})
	}
	
}


extension String {
	
func slice(from: String, to: String) -> String {

	return (range(of: from)?.upperBound).flatMap { substringFrom in
		(range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
			String(self[substringFrom..<substringTo].trimmingCharacters(in: .whitespacesAndNewlines))
		}
	} as! String
}
}
