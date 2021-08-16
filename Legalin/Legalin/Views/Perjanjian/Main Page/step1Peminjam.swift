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
    
    @State var showTanggalLahir = false
    
    @State var showAlert = false
    
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df
    }()
    
    var body: some View {
        NavigationView{
        VStack(alignment: .leading){
            
            pageIndicator(progressNumber: 1, progressName: "Pihak 1 - Peminjam", progressDetail: "Berikutnya: Pihak 2 - Pemberi Pinjaman").padding(.bottom, 15).padding(.top,25)
            
            ScrollView{
                VStack(alignment: .leading) {
                    
                    Text("KTP").font(.footnote).fontWeight(.medium).foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1))) .padding(.bottom,7)
                    
                    Button(action: {
						if cameraManager.permissionGranted {
							trimKtp.showScannerSheet = true
						} else {
							cameraManager.requestPermission()
						}
						
                    }, label: {
						Text("Ambil gambar KTP untuk isi otomatis \(Image(systemName: "camera.fill"))").fontWeight(.regular) .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                    })
                    Divider()
                        .fullScreenCover(isPresented: $trimKtp.showScannerSheet, content: {
                            trimKtp.makeScannerView()
                        }).padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        FormView(title: "NIK", profileValue: $perjanjianController.pihak1NIK, keyboardNum: true)
                        FormView(title: "Nama", profileValue: $perjanjianController.pihak1Nama, keyboardNum: false)
                        
                        DatePicker("Tanggal Lahir", selection:$perjanjianController.pihak1TanggalLahir, displayedComponents: .date).font(.body).accentColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
						Divider()
							.padding(.bottom)
                        
                        FormView(title: "Alamat", profileValue: $perjanjianController.pihak1Alamat, keyboardNum: false)
                        HStack {
                            FormView(title: "RT", profileValue: $perjanjianController.pihak1RT, keyboardNum: true)
                            FormView(title: "RW", profileValue: $perjanjianController.pihak1RW, keyboardNum: true)
                        }
                        FormView(title: "Kelurahan/Desa", profileValue: $perjanjianController.pihak1Kelurahan, keyboardNum: false)
                        FormView(title: "Kecamatan", profileValue: $perjanjianController.pihak1Kecamatan, keyboardNum: false)
                        FormView(title: "Kabupaten/Kota", profileValue: $perjanjianController.pihak1Kota, keyboardNum: false)
                        VStack(alignment:.leading) {
                            FormView(title: "Provinsi", profileValue: $perjanjianController.pihak1Provinsi, keyboardNum: false)
                            FormView(title: "Pekerjaan", profileValue: $perjanjianController.pihak1Pekerjaan, keyboardNum: false)
                            FormView(title: "Nomor Telepon", profileValue: $perjanjianController.pihak1NomorHP, keyboardNum: true)
                            Text("Pastikan semua data yang anda masukan sudah benar dan sesuai dengan KTP anda")
                                .font(.caption2)
                                .fontWeight(.regular)
                                .foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
                                .multilineTextAlignment(.leading)
                                .padding(.bottom,10)
                            
                            NavigationLink(
                                destination: step2Pemberi(masterPresentationMode: _presentationMode),
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
        .navigationBarTitle("Perjanjian Baru", displayMode: .inline)
        .navigationBarItems(trailing:
                                Button("Tutup") {
                                    showAlert = true
                                }.foregroundColor(.white))
        .alert(isPresented: $showAlert, content: {
            
            Alert(title: Text("Simpan Draft"),
                  message: Text("Apakah anda ingin menyimpan draft?"),
                  primaryButton:
                    .cancel(Text("Simpan")) {
                        perjanjianController.updatePinjamanCoreData(status: StatusSurat.draft)
                        presentationMode.wrappedValue.dismiss()
                                },
                  secondaryButton:
                    .destructive(Text("Hapus")){
                        
                        presentationMode.wrappedValue.dismiss()
                    
                  })
            
        })
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
