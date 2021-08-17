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
	@State var shown = false
	
	var body: some View {
		ScrollView {
			ZStack {
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
							FormView(title: "NIK", profileValue: $profileController.pihak1NIK, keyboardNum: true, isDisable: false)
							FormView(title: "Nama", profileValue: $profileController.pihak1Nama, keyboardNum: false, isDisable: false)
							FormView(title: "Alamat", profileValue: $profileController.pihak1Alamat, keyboardNum: false, isDisable: false)
							HStack {
								FormView(title: "RT", profileValue: $profileController.pihak1RT, keyboardNum: true, isDisable: false)
								FormView(title: "RW", profileValue: $profileController.pihak1RW, keyboardNum: true, isDisable: false)
							}
							FormView(title: "Kelurahan/Desa", profileValue: $profileController.pihak1Kelurahan, keyboardNum: false, isDisable: false)
							FormView(title: "Kecamatan", profileValue: $profileController.pihak1Kecamatan, keyboardNum: false, isDisable: false)
							FormView(title: "Kabupaten/Kota", profileValue: $profileController.pihak1Kota, keyboardNum: false, isDisable: false)
							VStack {
								FormView(title: "Provinsi", profileValue: $profileController.pihak1Provinsi, keyboardNum: false, isDisable: false)
								FormView(title: "Pekerjaan", profileValue: $profileController.pihak1Pekerjaan, keyboardNum: false, isDisable: false)
								FormView(title: "Nomor Telepon", profileValue: $profileController.pihak1NomorHP, keyboardNum: true, isDisable: false)
							}
						}
					}
//					Button(action: {
//						shown.toggle()
//						profileController.updateProfileCoreData()
//					}, label: {
//						ButtonNext(text: "Simpan", isDataComplete: true)
//					})
					
					Button("\(Text("Simpan").fontWeight(.semibold).foregroundColor(.white))") {
//						profileController.updateProfileCoreData()
						shown.toggle()
						
					}
					.frame(width: UIScreen.main.bounds.width - 35, height: 50, alignment: .center)
					.background(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
					.cornerRadius(10)

				}
				.background(shown ? Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.5)) : Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)))
				if shown {
					AlertSave(shown: $shown)
				}
			}
		}.frame(width: UIScreen.main.bounds.width - 35,
				alignment: .leading)
	}

	struct NewProfileView_Previews: PreviewProvider {
		static var previews: some View {
			NewProfileView()
		}
	}
}
