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
	@StateObject var cameraManager = CameraManager()
	
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
	@State var isDisable:Bool = false
	@State var textfieldDisable:Bool = false
	
	@State var showTanggalLahir = false
	@State var tanggalLahir = Date()
	
	let dateFormatter: DateFormatter = {
		let df = DateFormatter()
		df.dateStyle = .medium
		return df
	}()
	
	var body: some View {
		ScrollView(showsIndicators: false) {
			ZStack {
				VStack(alignment: .leading) {
					VStack(alignment: .leading) {
						
						Text("KTP").font(.footnote).fontWeight(.medium).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
							.padding(.top)
							.padding(.bottom,7)
							.padding(.horizontal)
						
						if (profileController.pihak1IsOpenCam == true) {
							Button(action: {
								if cameraManager.permissionGranted {
									trimKtp.showScannerSheet = true
								} else {
									cameraManager.requestPermission()
								}
								
							}, label: {
								Text("Ambil Ulang Gambar KTP \(Image(systemName: "checkmark.rectangle.fill"))").fontWeight(.regular) .foregroundColor(Color("tabBarColor"))
							}).padding(.horizontal)
							Divider()
								.fullScreenCover(isPresented: $trimKtp.showScannerSheet, content: {
									trimKtp.makeScannerView()
								}).padding(.bottom)
						} else {
							Button(action: {
								if cameraManager.permissionGranted {
									trimKtp.showScannerSheet = true
								} else {
									cameraManager.requestPermission()
								}
								
							}, label: {
								Text("Ambil gambar KTP untuk isi otomatis \(Image(systemName: "camera.fill"))").fontWeight(.regular) .foregroundColor(Color("tabBarColor"))
							}).padding(.horizontal)
							Divider()
								.fullScreenCover(isPresented: $trimKtp.showScannerSheet, content: {
									trimKtp.makeScannerView()
								}).padding(.bottom)
						}
						
						VStack(alignment: .leading) {
							FormView(title: "NIK", profileValue: $profileController.pihak1NIK, keyboardNum: true, isDisable: $isDisable)
							FormView(title: "Nama", profileValue: $profileController.pihak1Nama, keyboardNum: false, isDisable: $isDisable)
							VStack(alignment: .leading){
								Text("Tanggal Lahir").font(.footnote).fontWeight(.regular).foregroundColor(Color("labelColor"))
									.padding(.bottom,5)
								if Calendar.current.isDateInToday(profileController.pihak1TanggalLahir) {
									Text("Pilih Tanggal Lahir Sesuai KTP")
										.font(.body)
										.fontWeight(.regular)
										.foregroundColor(Color("tabBarColor"))
										.onTapGesture {
										showTanggalLahir.toggle()
									}
								} else {
									Text(profileController.pihak1TanggalLahir, formatter: dateFormatter)
										.font(.body)
										.fontWeight(.regular)
										.foregroundColor(Color("tabBarColor"))
										.onTapGesture {
											showTanggalLahir.toggle()
										}
								}
								
								Divider()
									.padding(.bottom)
							}.padding(.horizontal)
							if showTanggalLahir {
								DatePicker("", selection: $profileController.pihak1TanggalLahir, displayedComponents: .date)
									.datePickerStyle(GraphicalDatePickerStyle())
									.padding(.horizontal)
									.accentColor(Color("tabBarColor"))
							}
							CustomTextEditor(textData: $profileController.pihak1Alamat, isDisableAddress: $isDisable)
							HStack {
								FormView(title: "RT", profileValue: $profileController.pihak1RT, keyboardNum: true, isDisable: $isDisable)
									.frame(maxWidth: UIScreen.main.bounds.width / 2)
								FormView(title: "RW", profileValue: $profileController.pihak1RW, keyboardNum: true, isDisable: $isDisable)
									.frame(maxWidth: UIScreen.main.bounds.width / 2)
							}.frame(maxWidth: UIScreen.main.bounds.width)
							FormView(title: "Kelurahan/Desa", profileValue: $profileController.pihak1Kelurahan, keyboardNum: false, isDisable: $isDisable)
							FormView(title: "Kecamatan", profileValue: $profileController.pihak1Kecamatan, keyboardNum: false, isDisable: $isDisable)
							FormView(title: "Kabupaten/Kota", profileValue: $profileController.pihak1Kota, keyboardNum: false, isDisable: $isDisable)
							VStack(alignment:.leading) {
								FormView(title: "Provinsi", profileValue: $profileController.pihak1Provinsi, keyboardNum: false, isDisable: $isDisable)
								FormView(title: "Pekerjaan", profileValue: $profileController.pihak1Pekerjaan, keyboardNum: false, isDisable: $isDisable)
								FormView(title: "Nomor Telepon", profileValue: $profileController.pihak1NomorHP, keyboardNum: true, isDisable: $isDisable)
								Text("Pastikan semua data yang anda masukan sudah benar")
									.font(.caption2)
									.fontWeight(.regular)
									.foregroundColor(Color("tabBarColor"))
									.multilineTextAlignment(.leading)
									.padding(.horizontal,20)
								Text("dan sesuai dengan KTP anda")
									.font(.caption2)
									.fontWeight(.regular)
									.foregroundColor(Color("tabBarColor"))
									.multilineTextAlignment(.leading)
									.padding(.bottom,10)
									.padding(.horizontal,20)
								Button(action: {
									shown.toggle()
									profileController.setProfileOpenCamToFalse(isOpenCam: false)
								}, label: {
									ButtonNext(text: "Simpan", isDataComplete: true)
								}).padding(.bottom)
							}
						}
					}
					
				}
				.frame(maxWidth: UIScreen.main.bounds.width)
				if shown {
					AlertSave(shown: $shown, textField: $textfieldDisable)
				}
			}
		}
		.clipped()
		.frame(maxWidth: UIScreen.main.bounds.width)
		.navigationBarTitleDisplayMode(.inline)
		.navigationBarBackButtonHidden(true)
		.navigationBarItems(leading:
								Button(action: {
									mode.wrappedValue.dismiss()
								}, label: {
									Image(systemName: "chevron.left")
										.foregroundColor(.white)
									Text("Profil")
										.foregroundColor(.white)
								})
		)
	}
	
	struct NewProfileView_Previews: PreviewProvider {
		static var previews: some View {
			NewProfileView()
		}
	}
}
