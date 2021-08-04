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
	@State var ktpContent = "Nama : Rahmannur Rizki Syahputra"
	@State var simpan = ""
	@ObservedObject var extractktpinfo = Legalin.extractKtpInfo()
	@State var nampungDataKtp:[nampungKtpData] = []
	@State var scandata:ScanData?
	
	var body: some View {
//		VStack {
//
//			List {
//
////					.navigationTitle("Profile")
//
//			}.listStyle(DefaultListStyle())
//
//		}
		ScrollView {
			VStack() {
				VStack(alignment: .leading) {
					
					Button(action: {
						self.showScannerSheet = true
					}, label: {
						Text("Ambil gambar KTP untuk isi otomatis \(Image(systemName: "camera.fill"))").foregroundColor(Color(#colorLiteral(red: 0, green: 0.2837583721, blue: 0.423648268, alpha: 1)))
					})
					Divider()
					.sheet(isPresented: $showScannerSheet, content: {
						makeScannerView()
					}).padding(.bottom)
					
					ForEach(texts, id: \.id) { text in
						Text(text.content)
					}
					
					
					FormView(title: "NIK", profileValue: profiledata.nik)
					FormView(title: "Nama", profileValue: scandata!.namaEdited)
					DatePicker("Tanggal Lahir", selection: $profiledata.tanggalLahir, displayedComponents: .date).padding(.bottom)
				}
				VStack{
					FormView(title: "Alamat", profileValue: profiledata.alamat)
					HStack {
						FormView(title: "RT", profileValue: profiledata.Rt)
						FormView(title: "RW", profileValue: profiledata.Rw)
					}
					FormView(title: "Kelurahan", profileValue: profiledata.Kelurahan)
					FormView(title: "Kecamatan", profileValue: profiledata.Kecamatan)
					FormView(title: "Kabupaten", profileValue: profiledata.Kabupaten)
					FormView(title: "Provinsi", profileValue: profiledata.Provinsi)
					FormView(title: "Pekerjaan", profileValue: profiledata.pekerjaan)
					FormView(title: "Nomor Telepon", profileValue: profiledata.nomorHp)
				}
				
				NavigationLink(
					destination: FilledProfileView(profile: profiledata),
					label: {
						Text("Simpan")
							.font(.body)
							.fontWeight(.bold)
							.foregroundColor(Color.white)
							.multilineTextAlignment(.center)
							.padding(10)
							.background(Color(#colorLiteral(red: 0, green: 0.2801953852, blue: 0.4238004684, alpha: 1)))
							.cornerRadius(10)
					})
			}.padding()
			
		}
	}
	
	private func extractKtpInfo(ktpContent: String){
		let namaIndex = ktpContent.firstIndex(of: ":")!
		let nama = ktpContent.index(after: namaIndex)
		if ktpContent.contains("Nama") {
			nama
			print(nama)
		}
		
	}
	
	private func makeScannerView() -> ScannerView {
		ScannerView(completion: {
			textPerPage in
			if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
				print(outputText)
				print(textPerPage)
//				switch outputText {
//				case 1:
//					<#code#>
//				default:
//					<#code#>
//				}
				let newScanData = ScanData(content: outputText, nama: "")
				self.texts.append(newScanData)
			}
			self.showScannerSheet = false
		})
	}
}

struct NewProfileView_Previews: PreviewProvider {
	static var previews: some View {
		NewProfileView()
	}
}
