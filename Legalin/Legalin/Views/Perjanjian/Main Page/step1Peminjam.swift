//
//  step1Peminjam.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct step1Peminjam: View {
	
	@ObservedObject var trimKtp = functionTrimKtp()
	@State var showTanggalLahir = false
	
	var body: some View {
		NavigationView{
			VStack(alignment: .leading){
				
				pageIndicator(progressNumber: 1, progressName: "Pihak 1 - Peminjam", progressDetail: "Berikutnya: Pihak 2 - Pemberi Pinjaman").padding(.bottom, 15).padding(.top,25)
				
				ScrollView{
					VStack(alignment: .leading) {
						
						Text("KTP").font(.footnote).fontWeight(.medium).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1))) .padding(.bottom,7)
						
						Button(action: {
							trimKtp.showScannerSheet = true
						}, label: {
							Text("Ambil gambar KTP untuk isi otomatis \(Image(systemName: "camera.fill"))").foregroundColor(Color(#colorLiteral(red: 0, green: 0.2837583721, blue: 0.423648268, alpha: 1)))
						})
						Divider()
							.fullScreenCover(isPresented: $trimKtp.showScannerSheet, content: {
								trimKtp.makeScannerView()
							}).padding(.bottom)
						
						VStack(alignment: .leading) {
							FormView(title: "NIK", profileValue: $trimKtp.ktpInfo.nik, keyboardNum: true)
							FormView(title: "Nama", profileValue: $trimKtp.ktpInfo.nama, keyboardNum: false)
							DatePicker("Tanggal Lahir", selection:$trimKtp.ktpInfo.tanggalLahir, displayedComponents: .date) .padding(.bottom)
							
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
								FormView(title: "Nomor Telepon", profileValue: $trimKtp.ktpInfo.nomorHp, keyboardNum: true)
								Text("Pastikan semua data yang anda masukan sudah benar dan sesuai dengan KTP anda")
									.font(.caption2)
									.fontWeight(.regular)
									.foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
									.multilineTextAlignment(.leading)
									.padding(.bottom,10)
							}
						}
					}.padding(.top,10)
				}
				
				NavigationLink(
					destination: step2Pemberi(),
					label: {
						ButtonNext(text: "Lanjutkan")
					})
				
				Spacer()
				
			}.frame(width: UIScreen.main.bounds.width - 35,
					alignment: .leading)
			.navigationBarTitle("Perjanjian Baru", displayMode: .inline)
			.navigationBarItems(trailing: Text("Tutup").foregroundColor(.white))
		}
		
	}
}

extension UINavigationController{
	open override func viewDidLoad() {
		super.viewDidLoad()
		
		let appearance = UINavigationBarAppearance()
		appearance.backgroundColor = #colorLiteral(red: 0, green: 0.2837583721, blue: 0.423648268, alpha: 1)
		appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
		
		navigationBar.standardAppearance = appearance
	}
}

struct step1Peminjam_Previews: PreviewProvider {
	static var previews: some View {
		step1Peminjam()
	}
}
