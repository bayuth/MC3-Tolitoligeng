//
//  step2Pemberi.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct step2Pemberi: View {
    
    @Environment(\.presentationMode) var masterPresentationMode
    
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    @ObservedObject var trimKtp = functionTrimKtp(pihak: 2)
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@State var showTanggalLahir = false
	@State var titleLahir = "Pilih Tanggal Lahir"
    @State var showAlert = false
    
	let dateFormatter: DateFormatter = {
		let df = DateFormatter()
		df.dateStyle = .medium
		return df
	}()
	
	var body: some View {
		VStack(alignment: .leading){
			
			pageIndicator(progressNumber: 2, progressName: "Pihak 2 - Pemberi Peminjam", progressDetail: "Berikutnya: Detail Pinjaman").padding(.bottom, 15).padding(.top,25)
			
			ScrollView{
				VStack(alignment: .leading) {
					
                    ButtonBorderedComingSoon(icon: "person.fill", titleButton: "Pilih Identitas")
					
					Text("KTP").font(.footnote).fontWeight(.medium).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1))).padding(.bottom,7)
					
					Button(action: {
						trimKtp.showScannerSheet = true
					}, label: {
						Text("Ambil gambar KTP untuk isi otomatis \(Image(systemName: "camera.fill"))").fontWeight(.regular).foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
					})
					Divider()
						.fullScreenCover(isPresented: $trimKtp.showScannerSheet, content: {
							trimKtp.makeScannerView()
						}).padding(.bottom)
					
					VStack {
                        FormView(title: "NIK", profileValue: $perjanjianController.pihak2NIK, keyboardNum: true)
						FormView(title: "Nama", profileValue: $perjanjianController.pihak2Nama, keyboardNum: false)
						DatePicker("Tanggal Lahir", selection:$perjanjianController.pihak2TanggalLahir, displayedComponents: .date).font(.body).accentColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
						Divider()
							.padding(.bottom)
						FormView(title: "Alamat", profileValue: $perjanjianController.pihak2Alamat, keyboardNum: false)
						HStack {
							FormView(title: "RT", profileValue: $perjanjianController.pihak2RT, keyboardNum: true)
							FormView(title: "RW", profileValue: $perjanjianController.pihak2RW, keyboardNum: true)
						}
						FormView(title: "Kelurahan/Desa", profileValue: $perjanjianController.pihak2Kelurahan, keyboardNum: false)
						FormView(title: "Kecamatan", profileValue: $perjanjianController.pihak2Kecamatan, keyboardNum: false)
						FormView(title: "Kabupaten/Kota", profileValue: $perjanjianController.pihak2Kota, keyboardNum: false)
						VStack(alignment:.leading) {
							FormView(title: "Provinsi", profileValue: $perjanjianController.pihak2Provinsi, keyboardNum: false)
							FormView(title: "Pekerjaan", profileValue: $perjanjianController.pihak2Pekerjaan, keyboardNum: false)
							FormView(title: "Nomor Handphone", profileValue: $perjanjianController.pihak2NomorHP, keyboardNum: true)
							FormView(title: "Nama Bank", profileValue: $perjanjianController.pihak2NamaBank, keyboardNum: false)
							FormView(title: "Nomor Rekening", profileValue: $perjanjianController.pihak2NomorRekening, keyboardNum: true)
							FormView(title: "Atas Nama Rekening", profileValue: $perjanjianController.pihak2AtasNamaRekening, keyboardNum: false)
							Text("Pastikan semua data yang anda masukan sudah benar dan sesuai dengan KTP dan dokumen anda")
								.font(.caption2)
								.fontWeight(.regular)
								.foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
								.multilineTextAlignment(.leading)
								.padding(.bottom,10)
                            
                            NavigationLink(
                                destination: step3Detail(masterPresentationMode3 : _masterPresentationMode),
                                label: {
                                    ButtonNext(text: "Lanjutkan", isDataComplete: true)
                                })
						}
					}
				}.padding(.top,10)
			}
			
			
			
			Spacer()
			
		}.frame(width: UIScreen.main.bounds.width - 35,
				alignment: .leading)
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
                                    showAlert = true
                                }.foregroundColor(.white)).alert(isPresented: $showAlert, content: {
                                    
                                    Alert(title: Text("Simpan Draft"),
                                          message: Text("Apakah anda ingin menyimpan draft?"),
                                          primaryButton:
                                            .destructive(Text("Hapus")){
                                                masterPresentationMode.wrappedValue.dismiss()
                                                        },
                                          secondaryButton:
                                            .cancel(Text("Simpan")) {
                                                masterPresentationMode.wrappedValue.dismiss()
                                          })
                                    
                                })
        
	}
}

struct step2Pemberi_Previews: PreviewProvider {
	static var previews: some View {
		step2Pemberi()
	}
}
