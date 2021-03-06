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
	@State var editIsDisabledColor = Color("tabBarColor")
	
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
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 280, maxHeight: 280)
						Text("Belum Ada Profil")
							.font(.headline).fontWeight(.bold).padding(.top, 10)
						Text("Buat profil baru untuk \n mempermudah membuat perjanjian")
							.font(.body).padding(.top,-15)
							
							.multilineTextAlignment(.center).padding()
                        Spacer()
						
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
										if texfieldDisable {
											if Calendar.current.isDateInToday(profileController.pihak1TanggalLahir) {
												Text("Pilih Tanggal Lahir")
													.font(.body)
													.fontWeight(.regular)
													.foregroundColor(Color("labelColor"))
											} else {
												Text(profileController.pihak1TanggalLahir, formatter: dateFormatter)
													.font(.body)
													.fontWeight(.regular)
													.foregroundColor(Color("labelColor"))
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
									CustomTextEditor(textData: $profileController.pihak1Alamat, isDisableAddress: $texfieldDisable)
									HStack {
										FormView(title: "RT", profileValue: $profileController.pihak1RT, keyboardNum: true, isDisable: $texfieldDisable)
											.lineLimit(2)
											.frame(maxWidth: UIScreen.main.bounds.width/2)
										FormView(title: "RW", profileValue: $profileController.pihak1RW, keyboardNum: true, isDisable: $texfieldDisable)
											.lineLimit(2)
											.frame(maxWidth: UIScreen.main.bounds.width/2)
									}.frame(maxWidth: UIScreen.main.bounds.width)
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
											editIsDisabledColor = Color("tabBarColor")
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
								.frame(maxWidth: UIScreen.main.bounds.width)
	//							.padding(.horizontal)
								
	//							if debugPopUp {
	//								AlertSave(shown: $shown, textField: $texfieldDisable)
	//									.edgesIgnoringSafeArea(.all)
	//							}
							}
							Spacer()
						}
						
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
//											Button("\(Image(systemName: "square.and.pencil"))", action: {
//												editIsDisabled = true
//												texfieldDisable = false
//											})
//											.foregroundColor(editIsDisabledColor)
//											.disabled(editIsDisabled)
//											.onTapGesture {
//												editIsDisabledColor = Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
//											}
											Image(systemName: "square.and.pencil")
												.foregroundColor(editIsDisabledColor)
												.disabled(editIsDisabled)
												.onTapGesture {
													editIsDisabled = true
													texfieldDisable = false
													editIsDisabledColor = Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
												}
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
