//
//  step2Pemberi.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct step2Pemberi: View {
	
	@ObservedObject var trimKtp = functionTrimKtp()
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@State var showTanggalLahir = false
	@State var titleLahir = "Pilih Tanggal Lahir"
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
					
					Text("KTP").font(.footnote).fontWeight(.medium).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1))) .padding(.bottom,7)
					
					Button(action: {
						trimKtp.showScannerSheet = true
					}, label: {
						Text("Ambil gambar KTP untuk isi otomatis \(Image(systemName: "camera.fill"))").foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
					})
					Divider()
						.fullScreenCover(isPresented: $trimKtp.showScannerSheet, content: {
							trimKtp.makeScannerView()
						}).padding(.bottom)
					
					VStack {
						FormView(title: "NIK", profileValue: $trimKtp.ktpInfo.nik, keyboardNum: true)
						FormView(title: "Nama", profileValue: $trimKtp.ktpInfo.nama, keyboardNum: false)
						DatePicker("Tanggal Lahir", selection:$trimKtp.ktpInfo.tanggalLahir, displayedComponents: .date).accentColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
						Divider()
							.padding(.bottom)
						FormView(title: "Alamat", profileValue: $trimKtp.ktpInfo.alamat, keyboardNum: false)
						HStack {
							FormView(title: "RT", profileValue: $trimKtp.ktpInfo.Rt, keyboardNum: true)
							FormView(title: "RW", profileValue: $trimKtp.ktpInfo.Rw, keyboardNum: true)
						}
						FormView(title: "Kelurahan/Desa", profileValue: $trimKtp.ktpInfo.kelurahan, keyboardNum: false)
						FormView(title: "Kecamatan", profileValue: $trimKtp.ktpInfo.kecamatan, keyboardNum: false)
						FormView(title: "Kabupaten/Kota", profileValue: $trimKtp.ktpInfo.kota, keyboardNum: false)
						VStack(alignment:.leading) {
							FormView(title: "Provinsi", profileValue: $trimKtp.ktpInfo.provinsi, keyboardNum: false)
							FormView(title: "Pekerjaan", profileValue: $trimKtp.ktpInfo.pekerjaan, keyboardNum: false)
							FormView(title: "Nomor Handphone", profileValue: $trimKtp.ktpInfo.nomorHp, keyboardNum: true)
							FormView(title: "Nama Bank", profileValue: $trimKtp.ktpInfo.namaBank, keyboardNum: false)
							FormView(title: "Nomor Rekening", profileValue: $trimKtp.ktpInfo.nomorRekening, keyboardNum: true)
							FormView(title: "Atas Nama Rekening", profileValue: $trimKtp.ktpInfo.atasNamaRekening, keyboardNum: false)
							Text("Pastikan semua data yang anda masukan sudah benar dan sesuai dengan KTP dan dokumen anda")
								.font(.caption2)
								.fontWeight(.regular)
								.foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
								.multilineTextAlignment(.leading)
								.padding(.bottom,10)
                            
                            NavigationLink(
                                destination: step3Detail(),
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
							, trailing: ButtonTutup().foregroundColor(Color.white))
	}
}

struct step2Pemberi_Previews: PreviewProvider {
	static var previews: some View {
		step2Pemberi()
	}
}
