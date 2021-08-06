//
//  ProfileView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 29/07/21.
//

import SwiftUI

struct ProfileView: View {
		
//		@StateObject var ktpInfoKosong = ScanDataClass()
		@State var nik: String = ""
		@State var nama: String = ""
		@State var birthDate = Date()
		@State var alamat: String = ""
		@State var pekerjaan: String = ""
		@State var nomorHp: String = ""
		
		@ObservedObject var profiledata = functionTrimKtp()
		
		var body: some View {
			NavigationView {
				VStack(alignment: .center) {
					
					if profiledata.ktpInfo.nik == ""{
						Text("Belum Ada Profil")
							.font(.headline).padding(5)
						Text("Buat profil baru untuk \n mempermudah membuat perjanjian")
							.font(.body)
							.fontWeight(.light)
							.multilineTextAlignment(.center).padding()
					}
					else {
						VStack {
							FormView(title: "NIK", profileValue: $profiledata.ktpInfo.nik, keyboardNum: true).disabled(true)
							FormView(title: "Nama", profileValue: $profiledata.ktpInfo.nama, keyboardNum: false).disabled(true)
							DatePicker("Tanggal Lahir", selection: $profiledata.ktpInfo.tanggalLahir, displayedComponents: .date).padding(.bottom)
							FormView(title: "Alamat", profileValue: $profiledata.ktpInfo.alamat, keyboardNum: false).disabled(true)
							HStack {
								FormView(title: "RT", profileValue: $profiledata.ktpInfo.Rt, keyboardNum: true).disabled(true)
								FormView(title: "RW", profileValue: $profiledata.ktpInfo.Rw, keyboardNum: true).disabled(true)
							}
							FormView(title: "Kelurahan/Desa", profileValue: $profiledata.ktpInfo.kelurahan, keyboardNum: false).disabled(true)
							FormView(title: "Kecamatan", profileValue: $profiledata.ktpInfo.kecamatan, keyboardNum: false).disabled(true)
							FormView(title: "Kabupaten/Kota", profileValue: $profiledata.ktpInfo.kota, keyboardNum: false).disabled(true)
							VStack {
								FormView(title: "Provinsi", profileValue: $profiledata.ktpInfo.provinsi, keyboardNum: false).disabled(true)
								FormView(title: "Pekerjaan", profileValue: $profiledata.ktpInfo.pekerjaan, keyboardNum: false).disabled(true)
								FormView(title: "Nomor Telepon", profileValue: $profiledata.ktpInfo.nomorHp, keyboardNum: false).disabled(true)
							}
						}
					}
						
						
						
					NavigationLink(
						destination: NewProfileView(),
						label: {
							Text("Buat Profil")
						})
				}
				.navigationTitle("Profil")
				.navigationBarTitleDisplayMode(.large)
			}
			
			//			Text("Hello, \(nama)")
			//			.padding()
			
		}
	
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//		ProfileView(ktpInfoKosong: )
//    }
//}
