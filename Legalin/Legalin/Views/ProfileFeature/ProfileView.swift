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
	
	@ObservedObject var profileKtp = ScanDataClass()
	@ObservedObject var profiledata = functionTrimKtp(pihak: 0)
	
	@ObservedObject var profileController: ProfileController = .shared
	@ObservedObject var coreDataVM: CoreDataViewModel = .shared
	
	var body: some View {
		NavigationView {
			VStack(alignment: .center) {
				
				if (coreDataVM.pihak1.count == 0) {
					Image("Profile Empty")
					Text("Belum Ada Profil")
						.font(.headline).fontWeight(.bold).padding(.top, 10)
					Text("Buat profil baru untuk \n mempermudah membuat perjanjian")
						.font(.body).padding(.top,-15)
						
						.multilineTextAlignment(.center).padding()
					
					NavigationLink(
						destination: NewProfileView(),
						label: {
							ButtonNext(text: "Buat Profil", isDataComplete: true)
						})
				}
				
				else {
					ScrollView{
						VStack(alignment: .center) {
							FormView(title: "NIK", profileValue: $profileController.pihak1NIK, keyboardNum: true, isDisable: true).padding(.top)
							FormView(title: "Nama", profileValue: $profileController.pihak1Nama, keyboardNum: false, isDisable: true)
							
							FormView(title: "Alamat", profileValue: $profileController.pihak1Alamat, keyboardNum: false, isDisable: true).disabled(true)
							HStack {
								FormView(title: "RT", profileValue: $profileController.pihak1RT, keyboardNum: true, isDisable: true)
								FormView(title: "RW", profileValue: $profileController.pihak1RW, keyboardNum: true, isDisable: true)
							}
							FormView(title: "Kelurahan/Desa", profileValue: $profileController.pihak1Kelurahan, keyboardNum: false, isDisable: true)
							FormView(title: "Kecamatan", profileValue: $profileController.pihak1Kecamatan, keyboardNum: false, isDisable: true)
							FormView(title: "Kabupaten/Kota", profileValue: $profileController.pihak1Kota, keyboardNum: false, isDisable: true)
							VStack {
								FormView(title: "Provinsi", profileValue: $profileController.pihak1Provinsi, keyboardNum: false, isDisable: true)
								FormView(title: "Pekerjaan", profileValue: $profileController.pihak1Pekerjaan, keyboardNum: false, isDisable: true)
								FormView(title: "Nomor Telepon", profileValue: $profileController.pihak1NomorHP, keyboardNum: false, isDisable: true)
							}
						}
						.frame(width: UIScreen.main.bounds.width - 35,
							   alignment: .leading)
					}
					
				}
				
			}
			
			.navigationTitle("Profil")
			.navigationBarItems(trailing:
									HStack {
										NavigationLink(
											destination: PengaturanPage(),
											label: {
												Image(systemName: "gearshape.fill").foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
											})
										
										NavigationLink(
											destination: NewProfileView(),
											label: {
												Image(systemName: "square.and.pencil").foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
											})
									}
			)
			.navigationBarTitleDisplayMode(.large)
		}
	}
	
}

struct ProfileView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileView()
	}
}
