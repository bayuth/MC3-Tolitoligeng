//
//  step2Pemberi.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct step2Pemberi: View {
    
    @Environment(\.presentationMode) var masterPresentationMode
	@StateObject var cameraManager = CameraManager()
    
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    @ObservedObject var trimKtp = functionTrimKtp(pihak: 2)
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@State var showTanggalLahir = false
	@State var titleLahir = "Pilih Tanggal Lahir"
	@State var isDisable:Bool = false
    @State var showActionSheet = false
    
    //Validation page redirect
    @Binding var step1Redirect: Bool
    @State var step2Redirect: Bool = false
    
	let dateFormatter: DateFormatter = {
		let df = DateFormatter()
		df.dateStyle = .medium
		return df
	}()
	
	var body: some View {
		VStack(alignment: .leading){
			
			pageIndicator(progressNumber: 2, progressName: "Pihak 2 - Pemberi Peminjam", progressDetail: "Berikutnya: Detail Pinjaman").padding(.bottom, 15).padding(.top,25)
			
			ScrollView(showsIndicators: false){
				VStack(alignment: .leading) {
                    ButtonBordered(icon: "person.fill", titleButton: "Pilih Identitas", action: {}).padding(.horizontal)
					Text("KTP").font(.footnote).fontWeight(.medium).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1))).padding(.bottom,7)
                        .padding(.horizontal)
					
					if (perjanjianController.pihak2NIK != "" || perjanjianController.pihak2Nama != "" || perjanjianController.pihak2Alamat != "" || !Calendar.current.isDateInToday(perjanjianController.pihak2TanggalLahir) || perjanjianController.pihak2RT != "" || perjanjianController.pihak2RW != "" || perjanjianController.pihak2Kelurahan != "" || perjanjianController.pihak2Kecamatan != "" || perjanjianController.pihak2Kota != "" || perjanjianController.pihak2Provinsi != "") {
						Button(action: {
							if cameraManager.permissionGranted {
								trimKtp.showScannerSheet = true
							} else {
								cameraManager.requestPermission()
							}
							
						}, label: {
							Text("Ambil Ulang Gambar KTP \(Image(systemName: "checkmark.rectangle.fill"))").fontWeight(.regular) .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
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
							Text("Ambil gambar KTP untuk isi otomatis \(Image(systemName: "camera.fill"))").fontWeight(.regular) .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
						}).padding(.horizontal)
						Divider()
							.fullScreenCover(isPresented: $trimKtp.showScannerSheet, content: {
								trimKtp.makeScannerView()
							}).padding(.bottom)
					}
					
					VStack {
						FormView(title: "NIK", profileValue: $perjanjianController.pihak2NIK, keyboardNum: true, isDisable: $isDisable)
						FormView(title: "Nama", profileValue: $perjanjianController.pihak2Nama, keyboardNum: false, isDisable: $isDisable)
						VStack(alignment: .leading){
							Text("Tanggal Lahir").font(.footnote).fontWeight(.regular).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
								.padding(.bottom,5)
                                .padding(.horizontal)
							if Calendar.current.isDateInToday(perjanjianController.pihak2TanggalLahir) {
								Text("Pilih Tanggal Lahir Sesuai KTP")
									.font(.body)
									.fontWeight(.regular)
									.foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                                    .padding(.horizontal)
									.onTapGesture {
									showTanggalLahir.toggle()
								}
							} else {
								Text(perjanjianController.pihak2TanggalLahir, formatter: dateFormatter)
									.font(.body)
									.fontWeight(.regular)
									.foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                                    .padding(.horizontal)
									.onTapGesture {
										showTanggalLahir.toggle()
									}
							}
							Divider()
								.padding(.bottom)
						}
						if showTanggalLahir {
							DatePicker("", selection: $perjanjianController.pihak2TanggalLahir, displayedComponents: .date)
								.datePickerStyle(GraphicalDatePickerStyle())
								.padding(.horizontal)
						}
						FormView(title: "Alamat", profileValue: $perjanjianController.pihak2Alamat, keyboardNum: false, isDisable: $isDisable)
						HStack {
							FormView(title: "RT", profileValue: $perjanjianController.pihak2RT, keyboardNum: true, isDisable: $isDisable)
							FormView(title: "RW", profileValue: $perjanjianController.pihak2RW, keyboardNum: true, isDisable: $isDisable)
						}
						FormView(title: "Kelurahan/Desa", profileValue: $perjanjianController.pihak2Kelurahan, keyboardNum: false, isDisable: $isDisable)
						FormView(title: "Kecamatan", profileValue: $perjanjianController.pihak2Kecamatan, keyboardNum: false, isDisable: $isDisable)
						FormView(title: "Kabupaten/Kota", profileValue: $perjanjianController.pihak2Kota, keyboardNum: false, isDisable: $isDisable)
						VStack(alignment:.leading) {
							FormView(title: "Provinsi", profileValue: $perjanjianController.pihak2Provinsi, keyboardNum: false, isDisable: $isDisable)
							FormView(title: "Pekerjaan", profileValue: $perjanjianController.pihak2Pekerjaan, keyboardNum: false, isDisable: $isDisable)
							FormView(title: "Nomor Handphone", profileValue: $perjanjianController.pihak2NomorHP, keyboardNum: true, isDisable: $isDisable)
							FormView(title: "Nama Bank", profileValue: $perjanjianController.pihak2NamaBank, keyboardNum: false, isDisable: $isDisable)
							FormView(title: "Nomor Rekening", profileValue: $perjanjianController.pihak2NomorRekening, keyboardNum: true, isDisable: $isDisable)
							FormView(title: "Atas Nama Rekening", profileValue: $perjanjianController.pihak2AtasNamaRekening, keyboardNum: false, isDisable: $isDisable)
							Text("Pastikan semua data yang anda masukan sudah benar dan sesuai dengan KTP dan dokumen anda")
								.font(.caption2)
								.fontWeight(.regular)
								.foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
								.multilineTextAlignment(.leading)
								.padding(.bottom,10)
                                .padding(.horizontal)
                            
                            NavigationLink(
                                destination: step3Detail(masterPresentationMode3 : _masterPresentationMode ,step1Redirect: self.$step1Redirect, step2Redirect: self.$step2Redirect),isActive: $step2Redirect,
                                label: {
                                    ButtonNext(text: "Lanjutkan", isDataComplete: true)
                                }).isDetailLink(false)
						}
					}
				}.padding(.top,10)
			}
			
			
			
			Spacer()
			
		}
		.navigationBarBackButtonHidden(true)
		.navigationBarTitle("Perjanjian Baru", displayMode: .inline)
		.navigationBarItems(leading:
								Button(action: {
									self.presentationMode.wrappedValue.dismiss()
								}, label: {
									HStack{
										Image(systemName: "chevron.backward").aspectRatio(contentMode: .fill).foregroundColor(.white)
										Text("Kembali").foregroundColor(.white)
									}
								})
							, trailing:
                                Button("Tutup") {
                                    showActionSheet = true
                                }.foregroundColor(.white))
        .actionSheet(isPresented: $showActionSheet, content: {
                    
                    ActionSheet(
                        title: Text("Entri data perjanjian belum lengkap"),
                        buttons: [
                            .default(Text("Simpan")) {
                                perjanjianController.updatePinjamanCoreData(status: StatusSurat.draft)
                                self.masterPresentationMode.wrappedValue.dismiss()
                            },
                            .destructive(Text("Hapus")) {
                                self.masterPresentationMode.wrappedValue.dismiss()
                            },
                            .cancel(Text("Batalkan"))
                        ])
                    
                })
        
	}
}

//struct step2Pemberi_Previews: PreviewProvider {
//	static var previews: some View {
//		step2Pemberi()
//	}
//}
