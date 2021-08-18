//
//  ProfileView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 29/07/21.
//

import SwiftUI

struct ProfileView: View {
	
	//		@StateObject var ktpInfoKosong = ScanDataClass()
	
	@ObservedObject var profileKtp = ScanDataClass()
	@ObservedObject var profiledata = functionTrimKtp(pihak: 0)
	
	@ObservedObject var profileController: ProfileController = .shared
	@ObservedObject var coreDataVM: CoreDataViewModel = .shared
	@State var shown = false
	@State var texfieldDisable:Bool = true
	
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
					ScrollView(showsIndicators: false){
						ZStack {
							VStack(alignment: .center) {
								FormView(title: "NIK", profileValue: $profileController.pihak1NIK, keyboardNum: true, isDisable: $texfieldDisable).padding(.top)
								FormView(title: "Nama", profileValue: $profileController.pihak1Nama, keyboardNum: false, isDisable: $texfieldDisable)
								
								FormView(title: "Alamat", profileValue: $profileController.pihak1Alamat, keyboardNum: false, isDisable: $texfieldDisable).disabled(true)
								HStack {
									FormView(title: "RT", profileValue: $profileController.pihak1RT, keyboardNum: true, isDisable: $texfieldDisable)
									FormView(title: "RW", profileValue: $profileController.pihak1RW, keyboardNum: true, isDisable: $texfieldDisable)
								}
								FormView(title: "Kelurahan/Desa", profileValue: $profileController.pihak1Kelurahan, keyboardNum: false, isDisable: $texfieldDisable)
								FormView(title: "Kecamatan", profileValue: $profileController.pihak1Kecamatan, keyboardNum: false, isDisable: $texfieldDisable)
								FormView(title: "Kabupaten/Kota", profileValue: $profileController.pihak1Kota, keyboardNum: false, isDisable: $texfieldDisable)
								VStack {
									FormView(title: "Provinsi", profileValue: $profileController.pihak1Provinsi, keyboardNum: false, isDisable: $texfieldDisable)
									FormView(title: "Pekerjaan", profileValue: $profileController.pihak1Pekerjaan, keyboardNum: false, isDisable: $texfieldDisable)
									FormView(title: "Nomor Telepon", profileValue: $profileController.pihak1NomorHP, keyboardNum: false, isDisable: $texfieldDisable)
									
									Button(action: {
										shown.toggle()
									}, label: {
										ZStack{
											RoundedRectangle(cornerRadius: 10)
												.foregroundColor(texfieldDisable ? Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)) : Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
												.frame(width: UIScreen.main.bounds.width - 35, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
											
											Text("Simpan").fontWeight(.semibold).foregroundColor(.white)
										}
									}).disabled(texfieldDisable)
									.padding(.bottom)
								}
							}
							.frame(width: UIScreen.main.bounds.width - 35,
								   alignment: .leading)
							if shown {
								AlertSave(shown: $shown, textField: $texfieldDisable)
								
							}
						}
						.background(shown ? Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.5)) : Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)))
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
										if(coreDataVM.pihak1.count != 0) {
											Image(systemName: "square.and.pencil").foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
												.onTapGesture {
													texfieldDisable = false
												}
										}
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
