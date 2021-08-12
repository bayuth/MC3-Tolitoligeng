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
	
    @ObservedObject var trimKtp = functionTrimKtp(pihak: 0)
	@Environment(\.presentationMode) var mode: Binding<PresentationMode>
	@State var showingAlert = false
    
    @ObservedObject var profileController: ProfileController = .shared
	
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
					
					VStack {
                        FormView(title: "NIK", profileValue: $profileController.pihak1NIK, keyboardNum: true)
						FormView(title: "Nama", profileValue: $profileController.pihak1Nama, keyboardNum: false)
						FormView(title: "Alamat", profileValue: $profileController.pihak1Alamat, keyboardNum: false)
						HStack {
							FormView(title: "RT", profileValue: $profileController.pihak1RT, keyboardNum: true)
							FormView(title: "RW", profileValue: $profileController.pihak1RW, keyboardNum: true)
						}
						FormView(title: "Kelurahan/Desa", profileValue: $profileController.pihak1Kelurahan, keyboardNum: false)
						FormView(title: "Kecamatan", profileValue: $profileController.pihak1Kecamatan, keyboardNum: false)
						FormView(title: "Kabupaten/Kota", profileValue: $profileController.pihak1Kota, keyboardNum: false)
						VStack {
							FormView(title: "Provinsi", profileValue: $profileController.pihak1Provinsi, keyboardNum: false)
							FormView(title: "Pekerjaan", profileValue: $profileController.pihak1Pekerjaan, keyboardNum: false)
							FormView(title: "Nomor Telepon", profileValue: $profileController.pihak1NomorHP, keyboardNum: true)
						}
					}
				}
				
//				Button("Simpan") {
//					self.mode.wrappedValue.dismiss()
//					showingAlert = true
//				}.alert(isPresented: $showingAlert, content: {
//					Alert(title: Text("Berhasil!").font(.title).bold(), message: Text("Profil anda sukses tersimpan" ).font(.headline).fontWeight(.semibold), dismissButton: .default(Text("Tutup").font(.title).fontWeight(.bold)))
//				})
				
				Button(action: {
                    profileController.updateProfileCoreData()
					showingAlert = true
					self.mode.wrappedValue.dismiss()
				}, label: {
					Text("Simpan").font(.body).fontWeight(.bold).foregroundColor(.white).multilineTextAlignment(.center).padding(10).background(Color(#colorLiteral(red: 0, green: 0.2837583721, blue: 0.423648268, alpha: 1))).cornerRadius(10)
				}).alert(isPresented: $showingAlert, content: {
					Alert(title: Text("Berhasil!").font(.largeTitle).fontWeight(.black), message: Text("Profil anda sukses tersimpan").font(.headline).fontWeight(.semibold), dismissButton: .cancel(Text("Tutup").font(.largeTitle).fontWeight(.black)))
				})

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

	struct NewProfileView_Previews: PreviewProvider {
		static var previews: some View {
			NewProfileView()
		}
	}
}
