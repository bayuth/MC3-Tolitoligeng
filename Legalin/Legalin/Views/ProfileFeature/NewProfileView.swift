//
//  NewProfileView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 02/08/21.
//

import SwiftUI

struct NewProfileView: View {
	
	@ObservedObject var profiledata = profileData()
	
	var body: some View {
		VStack {
			List {
				
				VStack(alignment: .leading){
					Text("KTP").font(.footnote).fontWeight(.light)
					
					//					Button("Ambil gambar KTP untuk isi otomatis") {
					//						print("button tapped")
					//					}.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
					NavigationLink(
						destination: ProfileView()
					){Button("Ambil gambar KTP untuk isi otomatis") {
						print("button tapped")
					}.foregroundColor(.blue)}
				}
				
				VStack(alignment: .leading){
					Text("NIK").font(.footnote).fontWeight(.light)
					
					TextField("NIK", text: $profiledata.nik)
				}
				.padding(.top, 20)
				
				VStack(alignment: .leading){
					Text("Nama").font(.footnote).fontWeight(.light)
					
					TextField("Nama sesuai KTP", text: $profiledata.nama)
				}
				.padding(.top, 20)
				
				VStack(alignment: .leading){
					
					DatePicker("Tanggal Lahir", selection: $profiledata.tanggalLahir, in: ...Date(), displayedComponents: .date).accentColor(Color(#colorLiteral(red: 0, green: 0.2801953852, blue: 0.4238004684, alpha: 1)))
					
				}
				.padding(.top, 20)
				
				VStack(alignment: .leading){
					Text("Alamat").font(.footnote).fontWeight(.light)
					
					TextField("Alamat sesuai KTP", text: $profiledata.alamat)
				}
				.padding(.top, 20)
				
				VStack(alignment: .leading){
					Text("Pekerjaan").font(.footnote).fontWeight(.light)
					
					TextField("Pekerjaan sesuai KTP", text: $profiledata.pekerjaan)
				}
				.padding(.top, 20)
				
				VStack(alignment: .leading){
					Text("Nomor Handphone").font(.footnote).fontWeight(.light)
					
					TextField("Nomor aktif", text: $profiledata.nomorHp)
				}
				.padding(.top, 20)
				
			}.listStyle(DefaultListStyle())
			NavigationLink(
				destination: FilledProfileView(profile: profiledata),
				label: {
					Text("Simpan")
						.font(.body)
						.fontWeight(.bold)
						.foregroundColor(Color.blue)
				})
			
		}.padding(.bottom, 50)
	}
}

struct NewProfileView_Previews: PreviewProvider {
	static var previews: some View {
		NewProfileView()
	}
}
