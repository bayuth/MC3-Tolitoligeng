//
//  step1Peminjam.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct step1Peminjam: View {
	
	@Environment(\.presentationMode) var presentationMode
	@StateObject var cameraManager = CameraManager()
	
	@ObservedObject var trimKtp = functionTrimKtp(pihak: 1)
	@ObservedObject var perjanjianController: PerjanjianController = .shared
    @ObservedObject var coreDataVM: CoreDataViewModel = .shared
	
	@State var showTanggalLahir = false
	@State var tanggalLahir = Date()
	
	@State var isDisable:Bool = false
	@State var showActionSheet = false
    
    //Validation page redirect
    @State var step1Redirect: Bool = false
	
	let dateFormatter: DateFormatter = {
		let df = DateFormatter()
		df.dateStyle = .medium
		return df
	}()
	
	var body: some View {
		NavigationView{
				VStack(alignment: .leading){
					
					pageIndicator(progressNumber: 1, progressName: "Pihak 1 - Peminjam", progressDetail: "Berikutnya: Pihak 2 - Pemberi Pinjaman").padding(.bottom, 15).padding(.top,25)
                        .onAppear{
                            if perjanjianController.sender == "detailPage"{
                                perjanjianController.actionState = 0
                            }
                        }
					
					ScrollView(showsIndicators: false){
						VStack(alignment: .leading) {
							
                            VStack(alignment: .leading){
							Text("KTP").font(.footnote).fontWeight(.medium).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1))) .padding(.bottom,7)
								if (perjanjianController.pihak1IsOpenCam == true) {
									Button(action: {
										if cameraManager.permissionGranted {
											trimKtp.showScannerSheet = true
										} else {
											cameraManager.requestPermission()
										}
										
									}, label: {
										Text("Ambil Ulang Gambar KTP \(Image(systemName: "checkmark.rectangle.fill"))").fontWeight(.regular) .foregroundColor(Color("tabBarColor"))
									})
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
										Text("Ambil gambar KTP untuk isi otomatis \(Image(systemName: "camera.fill"))").fontWeight(.regular) .foregroundColor(Color("tabBarColor"))
									})
									Divider()
										.fullScreenCover(isPresented: $trimKtp.showScannerSheet, content: {
											trimKtp.makeScannerView()
										}).padding(.bottom)
								}
							
                            }.padding(.horizontal)
							
							VStack(alignment: .leading) {
								FormView(title: "NIK", profileValue: $perjanjianController.pihak1NIK, keyboardNum: true, isDisable: $isDisable)
								FormView(title: "Nama", profileValue: $perjanjianController.pihak1Nama, keyboardNum: false, isDisable: $isDisable)
								VStack(alignment: .leading){
									Text("Tanggal Lahir").font(.footnote).fontWeight(.regular).foregroundColor(Color("labelColor"))
                                        .padding(.bottom,5).padding(.horizontal)
									if Calendar.current.isDateInToday(perjanjianController.pihak1TanggalLahir){
                                       
                                        VStack{
                                        Text("Pilih Tanggal Lahir Sesuai KTP")
											.font(.body)
											.fontWeight(.regular)
											.foregroundColor(Color("tabBarColor"))
											.onTapGesture {
												showTanggalLahir.toggle()
                                            }.padding(.horizontal)
                                        
                                         .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        }
                                            .background(Color("emptyAlertColor").opacity(perjanjianController.endButtonPressed ? 0.15 : 0.0))
									} else {
										Text(perjanjianController.pihak1TanggalLahir, formatter: dateFormatter)
											.font(.body)
											.fontWeight(.regular)
											.foregroundColor(Color("tabBarColor"))
                                            .padding(.horizontal)
											.onTapGesture {
											showTanggalLahir.toggle()
											}
									}
									
									Divider()
								}
								if showTanggalLahir {
									DatePicker("", selection: $perjanjianController.pihak1TanggalLahir, displayedComponents: .date)
										.accentColor(Color("tabBarColor"))
										.datePickerStyle(GraphicalDatePickerStyle())
										.padding(.horizontal)
								}
								VStack {
//									FormView(title: "Alamat", profileValue: $perjanjianController.pihak1Alamat, keyboardNum: false, isDisable: $isDisable)
//									MultiLineFormView(alamat: $perjanjianController.pihak1Alamat, isDisable: $isDisable, emptyAlamat: "Alamat")
									CustomTextEditor(textData: $perjanjianController.pihak1Alamat, isDisableAddress: $isDisable)
								}
								HStack {
									FormView(title: "RT", profileValue: $perjanjianController.pihak1RT, keyboardNum: true, isDisable: $isDisable)
										.frame(maxWidth: UIScreen.main.bounds.width/2)
									FormView(title: "RW", profileValue: $perjanjianController.pihak1RW, keyboardNum: true, isDisable: $isDisable)
										.frame(maxWidth: UIScreen.main.bounds.width/2)
								}.frame(maxWidth: UIScreen.main.bounds.width)
								FormView(title: "Kelurahan/Desa", profileValue: $perjanjianController.pihak1Kelurahan, keyboardNum: false, isDisable: $isDisable)
								FormView(title: "Kecamatan", profileValue: $perjanjianController.pihak1Kecamatan, keyboardNum: false, isDisable: $isDisable)
								FormView(title: "Kabupaten/Kota", profileValue: $perjanjianController.pihak1Kota, keyboardNum: false, isDisable: $isDisable)
								VStack(alignment:.leading) {
									FormView(title: "Provinsi", profileValue: $perjanjianController.pihak1Provinsi, keyboardNum: false, isDisable: $isDisable)
									FormView(title: "Pekerjaan", profileValue: $perjanjianController.pihak1Pekerjaan, keyboardNum: false, isDisable: $isDisable)
									FormView(title: "Nomor Telepon", profileValue: $perjanjianController.pihak1NomorHP, keyboardNum: true, isDisable: $isDisable)
									Text("Pastikan semua data yang anda masukan sudah benar")
										.font(.caption2)
										.fontWeight(.regular)
										.foregroundColor(Color("tabBarColor"))
										.lineLimit(3)
										.multilineTextAlignment(.leading)
										.padding(.horizontal,20)
									Text("dan sesuai dengan KTP anda")
										.font(.caption2)
										.fontWeight(.regular)
										.foregroundColor(Color("tabBarColor"))
										.multilineTextAlignment(.leading)
										.padding(.bottom,10)
										.padding(.horizontal,20)
									
									NavigationLink(
                                        destination: step2Pemberi(masterPresentationMode: _presentationMode, step1Redirect: self.$step1Redirect),isActive: $step1Redirect,
										label: {
											ButtonNext(text: "Lanjutkan", isDataComplete: true)
                                        }).isDetailLink(false)
								}
							}
						}.padding(.top,10)
						.frame(maxWidth: UIScreen.main.bounds.width)
					}
					
				   
					
					Spacer()
					
                }
				.navigationBarTitle("Perjanjian Baru", displayMode: .inline)
				.navigationBarItems(trailing:
										Button("Tutup") {
											showActionSheet = true
										}.foregroundColor(.white))
				
			}.actionSheet(isPresented: $showActionSheet, content: {
				
				ActionSheet(
					title: Text("Entri data perjanjian belum lengkap"),
					buttons: [
						.default(Text("Simpan")) {
							perjanjianController.setPihak1OpenCamToFalse(isOpenCam: false)
							perjanjianController.setPihak2OpenCamToFalse(isOpenCam: false)
                            
                            if (perjanjianController.sender == "perjanjianBaru"){
                            perjanjianController.updatePinjamanCoreData(pinjaman: coreDataVM.createPinjaman(), status: StatusSurat.draft)
                            }
                            
                            if (perjanjianController.sender == "detailPage"){
                                perjanjianController.updatePinjamanCoreData(pinjaman: perjanjianController.detailPinjaman!, status: StatusSurat(rawValue: perjanjianController.statusSurat) ?? StatusSurat.draft)
                            }
                            
							self.presentationMode.wrappedValue.dismiss()
						},
						.destructive(Text(getTextKembali())) {
							perjanjianController.setPihak1OpenCamToFalse(isOpenCam: false)
							perjanjianController.setPihak2OpenCamToFalse(isOpenCam: false)
							self.presentationMode.wrappedValue.dismiss()
						},
						.cancel(Text("Batalkan"))
					])
				
			})
			}
        
    func getTextKembali() -> String {
        if perjanjianController.sender == "perjanjianBaru"{
            return "Hapus"
        } else {
            return "Kembali"
        }
    }
        
	}

extension UINavigationController{
	open override func viewDidLoad() {
		super.viewDidLoad()
		
		let appearance = UINavigationBarAppearance()
		appearance.backgroundColor = UIColor(Color("tabBarColor"))
		appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
		
		navigationBar.standardAppearance = appearance
	}
}

//struct AutoSizingTF: UIViewRepresentable {
//	var hint: String
//	@Binding var text: String
//
//	func makeUIView(context: Context) -> UITextView {
//		let textView = UITextView()
////		display hint
//		textView.text = hint
//		textView.textColor = .gray
//
//		textView.font = .systemFont(ofSize: 20)
//
//		return textView
//	}
//
//	func updateUIView(_ uiView: UITextView, context: Context) {
//	}
//}

struct step1Peminjam_Previews: PreviewProvider {
	static var previews: some View {
		step1Peminjam()
	}
}
