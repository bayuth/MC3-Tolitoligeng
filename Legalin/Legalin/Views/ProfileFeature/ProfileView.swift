//
//  ProfileView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 29/07/21.
//

import SwiftUI

struct ProfileView: View {
	
	//		@StateObject var ktpInfoKosong = ScanDataClass()
    
	
	init() {
		UINavigationBar.changeAppearance(clear: true)
	}
	
	@Environment (\.colorScheme) var colorScheme
	
	@ObservedObject var profileKtp = ScanDataClass()
	@ObservedObject var profiledata = functionTrimKtp(pihak: 0)
	
	@ObservedObject var profileController: ProfileController = .shared
	@ObservedObject var coreDataVM: CoreDataViewModel = .shared
	@State var shown = false
	@State var texfieldDisable:Bool = true
	@State var dateIsDisable:Bool = false
	var debugPopUp = true
	
	@State var showTanggalLahir = false
	@State var tanggalLahir = Date()
	@State var editIsDisabled:Bool = false
	@State var editIsDisabledColor = Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))
	
	let dateFormatter: DateFormatter = {
		let df = DateFormatter()
		df.dateStyle = .medium
		return df
	}()
	
	var body: some View {
		NavigationView {
			ZStack {
				VStack(alignment: .center) {
					RoundedRectangle(cornerRadius: 10).fill(Color(.white))
						.frame(maxWidth: .infinity, maxHeight: 1)
					
					if (coreDataVM.pihak1.count == 0) {
						Spacer()
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
						Spacer()
					}
					
					else {
						ScrollView(showsIndicators: false){
							ZStack {
								VStack(alignment: .center) {
									FormView(title: "NIK", profileValue: $profileController.pihak1NIK, keyboardNum: true, isDisable: $texfieldDisable).padding(.top)
									FormView(title: "Nama", profileValue: $profileController.pihak1Nama, keyboardNum: false, isDisable: $texfieldDisable)
									VStack(alignment: .leading){
										Text("Tanggal Lahir").font(.footnote).fontWeight(.regular).foregroundColor(Color("labelColor"))
//										DatePickerView(profileDate: $profileController.pihak1TanggalLahir, isDisable: $texfieldDisable)
										if texfieldDisable {
											if Calendar.current.isDateInToday(profileController.pihak1TanggalLahir) {
												Text("Pilih Tanggal Lahir")
													.font(.body)
													.fontWeight(.regular)
													.foregroundColor(Color("tabBarColor"))
											} else {
												Text(profileController.pihak1TanggalLahir, formatter: dateFormatter)
													.font(.body)
													.fontWeight(.regular)
													.foregroundColor(Color("tabBarColor"))
											}
										} else {
											if Calendar.current.isDateInToday(profileController.pihak1TanggalLahir) {
												Text("Pilih Tanggal Lahir")
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
//									FormView(title: "Alamat", profileValue: $profileController.pihak1Alamat, keyboardNum: false, isDisable: $texfieldDisable)
									
									MultiLineFormView(alamat: $profileController.pihak1Alamat, isDisable: $texfieldDisable)
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
											editIsDisabled.toggle()
										}, label: {
											ZStack{
												RoundedRectangle(cornerRadius: 10)
													.foregroundColor(texfieldDisable ? Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)) : Color("tabBarColor"))
													.frame(width: UIScreen.main.bounds.width - 35, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
												
												Text("Simpan").fontWeight(.semibold).foregroundColor(.white)
											}
										}).disabled(texfieldDisable)
										.padding(.bottom)
									}
								}
	//							.padding(.horizontal)
								
	//							if debugPopUp {
	//								AlertSave(shown: $shown, textField: $texfieldDisable)
	//									.edgesIgnoringSafeArea(.all)
	//							}
							}
							Spacer()
						}
	//					.background(shown ? Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.5)) : Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)))
						
					}
					
				}
				if shown {
					AlertSave(shown: $shown, textField: $texfieldDisable)
						.edgesIgnoringSafeArea(.all)
				}
			}
			
			.navigationTitle("Profil")
			.navigationBarItems(trailing:
									HStack {
										NavigationLink(
											destination: PengaturanPage(),
											label: {
												Image(systemName: "gearshape.fill")
													.foregroundColor(Color("tabBarColor"))
											})
										
										if(coreDataVM.pihak1.count != 0) {
											Button("\(Image(systemName: "square.and.pencil"))", action: {
												editIsDisabled = true
												texfieldDisable = false
											})
											.foregroundColor(Color("tabBarColor"))
											.disabled(editIsDisabled)
											
//											Image(systemName: "square.and.pencil")
//												.foregroundColor(Color("tabBarColor"))
//												.disabled(editIsDisabled)
//												.onTapGesture {
//													editIsDisabled = true
//
////													if editIsDisabled == true {
////														Text("done")
////
////													}
////													if showTanggalLahir {
////														showTanggalLahir.toggle()
////													}
////													texfieldDisable = false
//												}
										}
									}
			)
			.navigationBarTitleDisplayMode(.large)
		}
	}
	
}

extension UINavigationBar {
	static func changeAppearance(clear: Bool) {
		let appearance = UINavigationBarAppearance()
		
		if clear {
			appearance.configureWithTransparentBackground()
		} else {
			appearance.configureWithDefaultBackground()
		}
		UINavigationBar.appearance().standardAppearance = appearance
		UINavigationBar.appearance().compactAppearance = appearance
		UINavigationBar.appearance().scrollEdgeAppearance = appearance
	}
}

struct ProfileView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileView()
	}
}
