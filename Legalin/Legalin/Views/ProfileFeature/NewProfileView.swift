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
		VStack(alignment: .leading){
			ScrollView{
				ZStack {
					VStack(alignment: .leading) {
						
						Text("KTP").font(.footnote).fontWeight(.medium).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1))) .padding(.bottom,7)
						
						Button(action: {
							if cameraManager.permissionGranted {
								trimKtp.showScannerSheet = true
							} else {
								cameraManager.requestPermission()
							}
							
						}, label: {
							Text("Ambil gambar KTP untuk isi otomatis \(Image(systemName: "camera.fill"))").fontWeight(.regular) .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
						})
						Divider()
							.fullScreenCover(isPresented: $trimKtp.showScannerSheet, content: {
								trimKtp.makeScannerView()
							}).padding(.bottom)
						
						VStack(alignment: .leading) {
							FormView(title: "NIK", profileValue: $profileController.pihak1NIK, keyboardNum: true, isDisable: $isDisable)
							FormView(title: "Nama", profileValue: $profileController.pihak1Nama, keyboardNum: false, isDisable: $isDisable)
							VStack(alignment: .leading){
								Text("Tanggal Lahir").font(.footnote).fontWeight(.regular).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
								Text(profileController.pihak1TanggalLahir, formatter: dateFormatter)
									.font(.body)
									.foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
									.onTapGesture {
										showTanggalLahir.toggle()
									}
								Divider()
									.padding(.bottom)
							}
							if showTanggalLahir {
								DatePicker("", selection: $profileController.pihak1TanggalLahir, displayedComponents: .date)
									.datePickerStyle(GraphicalDatePickerStyle())
							}
							
							FormView(title: "Alamat", profileValue: $profileController.pihak1Alamat, keyboardNum: false, isDisable: $isDisable)
							HStack {
								FormView(title: "RT", profileValue: $profileController.pihak1RT, keyboardNum: true, isDisable: $isDisable)
								FormView(title: "RW", profileValue: $profileController.pihak1RW, keyboardNum: true, isDisable: $isDisable)
							}
							FormView(title: "Kelurahan/Desa", profileValue: $profileController.pihak1Kelurahan, keyboardNum: false, isDisable: $isDisable)
							FormView(title: "Kecamatan", profileValue: $profileController.pihak1Kecamatan, keyboardNum: false, isDisable: $isDisable)
							FormView(title: "Kabupaten/Kota", profileValue: $profileController.pihak1Kota, keyboardNum: false, isDisable: $isDisable)
							VStack(alignment:.leading) {
								FormView(title: "Provinsi", profileValue: $profileController.pihak1Provinsi, keyboardNum: false, isDisable: $isDisable)
								FormView(title: "Pekerjaan", profileValue: $profileController.pihak1Pekerjaan, keyboardNum: false, isDisable: $isDisable)
								FormView(title: "Nomor Telepon", profileValue: $profileController.pihak1NomorHP, keyboardNum: true, isDisable: $isDisable)
								Text("Pastikan semua data yang anda masukan sudah benar dan sesuai dengan KTP anda")
									.font(.caption2)
									.fontWeight(.regular)
									.foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
									.multilineTextAlignment(.leading)
									.padding(.bottom,10)
								Button(action: {
									shown.toggle()
								}, label: {
									ButtonNext(text: "Simpan", isDataComplete: true)
								}).padding(.bottom)
							}
						}
					}
					.padding(.horizontal)
					if shown {
						AlertSave(shown: $shown, textField: $textfieldDisable)
					}
				}
				
			}
			.background(shown ? Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.5)) : Color(#colorLiteral(red: 0.9607843137, green: 0.968627451, blue: 0.9725490196, alpha: 0)))
		}
	}
	
	struct NewProfileView_Previews: PreviewProvider {
		static var previews: some View {
			NewProfileView()
		}
	}
}
