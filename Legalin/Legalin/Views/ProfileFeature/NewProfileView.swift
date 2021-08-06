//
//  NewProfileView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 02/08/21.
//

import SwiftUI

struct NewProfileView: View {
	
	@ObservedObject var profiledata = profileData()
	@State var profiles:[profileData] = []
	
	@State private var showScannerSheet = false
	@State private var texts:[ScanData] = []
	@State var ktpInfoView:[ScanDataClass] = []
	@StateObject var ktpInfoKosong = ScanDataClass()
//	@StateObject var newKtpInfo:ScanDataClass
	@State var ktpContent = "Nama : Rahmannur Rizki Syahputra"
	@State var simpan = ""
	@ObservedObject var extractktpinfo = Legalin.extractKtpInfo()
	@State var nampungDataKtp:[nampungKtpData] = []
	@State var scandata:ScanData?
	@ObservedObject var trimKtp = functionTrimKtp()
	@Environment(\.presentationMode) var mode: Binding<PresentationMode>
	
	var body: some View {
		ScrollView {
			VStack() {
				VStack(alignment: .leading) {
					
					Button(action: {
						trimKtp.showScannerSheet = true
					}, label: {
						Text("Ambil gambar KTP untuk isi otomatis \(Image(systemName: "camera.fill"))").foregroundColor(Color(#colorLiteral(red: 0, green: 0.2837583721, blue: 0.423648268, alpha: 1)))
					})
					Divider()
						.fullScreenCover(isPresented: $trimKtp.showScannerSheet, content: {
							trimKtp.makeScannerView()
					}).padding(.bottom)
					
					
//					FormView(title: "NIK", profileValue: $ktpInfoKosong.nik, keyboardNum: true)
//					TextField("tes", text: $ktpInfoKosong.nik)
//					FormView(title: "Nama", profileValue: $ktpInfoKosong.nama, keyboardNum: false)
//					FormView(title: "Alamat", profileValue: $ktpInfoKosong.alamat, keyboardNum: false)
//					HStack {
//						FormView(title: "RT", profileValue: $ktpInfoKosong.Rt, keyboardNum: true)
//						FormView(title: "RW", profileValue: $ktpInfoKosong.Rw, keyboardNum: true)
//						}
//					FormView(title: "Kelurahan/Desa", profileValue: $ktpInfoKosong.kelurahan, keyboardNum: false)
//					VStack {
//						FormView(title: "Kecamatan", profileValue: $ktpInfoKosong.kecamatan, keyboardNum: false)
//						FormView(title: "Kabupaten/Kota", profileValue: $ktpInfoKosong.kota, keyboardNum: false)
//						FormView(title: "Provinsi", profileValue: $ktpInfoKosong.provinsi, keyboardNum: false)
//						FormView(title: "Pekerjaan", profileValue: $ktpInfoKosong.pekerjaan, keyboardNum: false)
//						FormView(title: "Nomor Telepon", profileValue: $ktpInfoKosong.nomorHp, keyboardNum: true)
//
//						FormView(title: "NIK", profileValue: $ktpInfoKosong.nik, keyboardNum: true)
//					}
					VStack {
						FormView(title: "NIK", profileValue: $trimKtp.ktpInfo.nik, keyboardNum: true)
						FormView(title: "Nama", profileValue: $trimKtp.ktpInfo.nama, keyboardNum: false)
						DatePicker("Tanggal Lahir", selection: $trimKtp.ktpInfo.tanggalLahir, displayedComponents: .date).padding(.bottom)
						FormView(title: "Alamat", profileValue: $trimKtp.ktpInfo.alamat, keyboardNum: false)
						HStack {
							FormView(title: "RT", profileValue: $trimKtp.ktpInfo.Rt, keyboardNum: true)
							FormView(title: "RW", profileValue: $trimKtp.ktpInfo.Rw, keyboardNum: true)
						}
						FormView(title: "Kelurahan/Desa", profileValue: $trimKtp.ktpInfo.kelurahan, keyboardNum: false)
						FormView(title: "Kecamatan", profileValue: $trimKtp.ktpInfo.kecamatan, keyboardNum: false)
						FormView(title: "Kabupaten/Kota", profileValue: $trimKtp.ktpInfo.kota, keyboardNum: false)
						VStack {
							FormView(title: "Provinsi", profileValue: $trimKtp.ktpInfo.provinsi, keyboardNum: false)
							FormView(title: "Pekerjaan", profileValue: $trimKtp.ktpInfo.pekerjaan, keyboardNum: false)
							FormView(title: "Nomor Telepon", profileValue: $trimKtp.ktpInfo.nomorHp, keyboardNum: true)
						}
					}
				}
				Button(action: {
					self.mode.wrappedValue.dismiss()
				}, label: {
					Text("Simpan")
				})
//				NavigationLink(
//					destination: FilledProfileView(profile:),
//					label: {
//						Text("Simpan")
//							.font(.body)
//							.fontWeight(.bold)
//							.foregroundColor(Color.white)
//							.multilineTextAlignment(.center)
//							.padding(10)
//							.background(Color(#colorLiteral(red: 0, green: 0.2801953852, blue: 0.4238004684, alpha: 1)))
//							.cornerRadius(10)
//					})
			}.padding()
			
		}
	}
	
//	private func makeScannerView() -> ScannerView {
//		ScannerView(completion: {
//			textPerPage in
//			if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
//				
//				print(outputText)
//				
//				let nikFromKtp = outputText.slice(from: "NIK", to: "Nama")
//				print(nikFromKtp)
//				var namaFromKtp = outputText.slice(from: "Nama", to:"Tempat")
//				if namaFromKtp.contains(": ") == true{
//					namaFromKtp = namaFromKtp.components(separatedBy: ": ").joined(separator: "")
//					print(namaFromKtp)
//				} else if namaFromKtp.contains(":") == true{
//					namaFromKtp = namaFromKtp.components(separatedBy: ":").joined(separator: "")
//					print(namaFromKtp)
//				} else if namaFromKtp.contains(" ") == true{
//					namaFromKtp = namaFromKtp.components(separatedBy: " ").joined(separator: "")
//					print(namaFromKtp)
//				}
//				else {
//					namaFromKtp = outputText.slice(from: "Nama", to: "Tempat")
//					print(namaFromKtp)
//				}
//				
////				let tanggalLahirFromKtp = outputText.slice(from: "Tempat/Tgl Lahir", to: "Jenis kelamin")
////				print(tanggalLahirFromKtp)
//				
//				let alamatFromKtp = outputText.slice(from: "Alamat", to: "RT")
//				print(alamatFromKtp)
//				
//				let rtRwFromKtp = outputText.slice(from: "RT/RW", to: "Kel")
//				var rtBersih = ""
//				var rwBersih = ""
//				if rtRwFromKtp.contains(": ") == true {
//					let rtRwFromKtp = outputText.components(separatedBy: ": ").joined(separator: "")
//					print(rtRwFromKtp)
//					if let rtIndex = rtRwFromKtp.firstIndex(of: "/") {
//						var rt = rtRwFromKtp.prefix(upTo: rtIndex)
//						rtBersih = String(rt)
//						print(rtBersih)
//					}
//					if let rwIndex = rtRwFromKtp.range(of: "/") {
//						var rw = rtRwFromKtp[rwIndex.upperBound...].trimmingCharacters(in: .whitespaces)
//						rwBersih = rw
//						print(rwBersih)
//					}
//					
//				}
//				if rtRwFromKtp.contains(":") == true {
//					let rtRwFromKtp = outputText.components(separatedBy: ":").joined(separator: "")
//					print(rtRwFromKtp)
//					if let rtIndex = rtRwFromKtp.firstIndex(of: "/") {
//						var rt = rtRwFromKtp.prefix(upTo: rtIndex)
//						rtBersih = String(rt)
//						print(rtBersih)
//					}
//					if let rwIndex = rtRwFromKtp.range(of: "/") {
//						var rw = rtRwFromKtp[rwIndex.upperBound...].trimmingCharacters(in: .whitespaces)
//						rwBersih = rw
//						print(rwBersih)
//					}
//				}
//				if rtRwFromKtp.contains(" ") == true {
//					let rtRwFromKtp = outputText.components(separatedBy: " ").joined(separator: "")
//					print(rtRwFromKtp)
//					if let rtIndex = rtRwFromKtp.firstIndex(of: "/") {
//						var rt = rtRwFromKtp.prefix(upTo: rtIndex)
//						rtBersih = String(rt)
//						print(rtBersih)
//					}
//					if let rwIndex = rtRwFromKtp.range(of: "/") {
//						var rw = rtRwFromKtp[rwIndex.upperBound...].trimmingCharacters(in: .whitespaces)
//						rwBersih = rw
//						print(rwBersih)
//					}
//				}
//				else {
//					let rtRwFromKtp = outputText.slice(from: "RT/RW", to: "Kel")
//					print(rtRwFromKtp)
//					if let rtIndex = rtRwFromKtp.firstIndex(of: "/") {
//						var rt = rtRwFromKtp.prefix(upTo: rtIndex)
//						rtBersih = String(rt)
//						print(rtBersih)
//					}
//					if let rwIndex = rtRwFromKtp.range(of: "/") {
//						var rw = rtRwFromKtp[rwIndex.upperBound...].trimmingCharacters(in: .whitespaces)
//						rwBersih = rw
//						print(rwBersih)
//					}
//					
//				}
//				let kelurahanFromKtp = outputText.slice(from: "Kel/Desa", to: "Kecamatan")
//				print(kelurahanFromKtp)
//				let kecamatanFromKtp = outputText.slice(from: "Kecamatan", to: "Agama")
//				print(kecamatanFromKtp)
//				let kotaFromKtp = outputText.slice(from: "KOTA", to: "NIK")
//				print(kotaFromKtp)
//				let provinsiFromKtp = outputText.slice(from: "PROVINSI", to: "KOTA")
//				print(provinsiFromKtp)
//				let pekerjaanFromKtp = outputText.slice(from: "Pekerjaan", to: "\nKewarga")
//				print(pekerjaanFromKtp)
//				
//				let newKtpInfo = ScanDataClass(nama: namaFromKtp, nik: nikFromKtp, tanggalLahir: Date(), alamat: alamatFromKtp, Rt: rtBersih, Rw: rwBersih, kelurahan: kelurahanFromKtp, kecamatan: kecamatanFromKtp, kota: kotaFromKtp, provinsi: provinsiFromKtp, pekerjaan: "", nomorHp: "")
//				self.ktpInfo.append(newKtpInfo)
//				
//				let newScanData = ScanData(content: outputText, nama: namaFromKtp, nik:nikFromKtp, alamat:alamatFromKtp, RtRw:rtRwFromKtp, kelurahan:kelurahanFromKtp, kecamatan:kecamatanFromKtp, kota:kotaFromKtp, provinsi:provinsiFromKtp)
//				self.texts.append(newScanData)
//			}
//			self.showScannerSheet = false
//		})
//	}
//}
//
//extension String {
//
//	func slice(from: String, to: String) -> String {
//
//		return (range(of: from)?.upperBound).flatMap { substringFrom in
//			(range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
//				String(self[substringFrom..<substringTo].trimmingCharacters(in: .whitespacesAndNewlines))
//			}
//		} as! String
//	}
//}

//struct NewProfileView_Previews: PreviewProvider {
//	static var previews: some View {
//		NewProfileView()
//	}
//}
}
