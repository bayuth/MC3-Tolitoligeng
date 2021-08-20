//
//  step3Detail.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct step3Detail: View {
    
    
    @Environment(\.presentationMode) var masterPresentationMode3
    @Environment(\.presentationMode) var presentationMode
    
    @State var tujuanPeminjaman = ""
    @State private var testOriginFrame: CGRect = .zero
    @State private var dateJatuhTempo = Date()
    @State private var dateTandaTangan = Date()
    @State private var showPickerJatuhTempo = false
    @State private var showPickerTandaTangan = false
    
    @State private var title = "Metode Bayaran"
    @State private var title1 = "Pilih Tanggal"
    @State private var title2 = "Pengadilan Negeri"
    @State private var title3 = "Pilih Tanggal"
    
	@State var isDisable:Bool = false
    @State var showActionSheet = false
    
    //Validation page redirect
    @Binding var step1Redirect: Bool
    @Binding var step2Redirect: Bool
    @State var step3Redirect: Bool = false
	
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    var tipeAgunan = ["Cicilan", "Kontan"]
    
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df
    }()
    @State private var valueDateJatuhTempo = "Pilih tanggal"
    var body: some View {
        
        VStack(alignment: .leading) {
            pageIndicator(progressNumber: 3, progressName: "Detail Pinjaman", progressDetail: "Berikutnya: Agunan").padding(.bottom, 15).padding(.top,25)
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading){
                    ButtonBordered(icon: "doc.text", titleButton: "Pilih Kredit (Opsional)")
                        .padding(.horizontal)
					FormView(title: "Tujuan Peminjaman", profileValue: $perjanjianController.tujuanPeminjaman, keyboardNum: false, isDisable: $isDisable)
                    SliderViewWithForm(sliderValue: $perjanjianController.jumlahPinjaman, text1: "Pinjaman Maksimal", text2: "Rp 50000000", title: "Jumlah Pinjaman", type: 0)
                    SliderViewWithForm(sliderValue: $perjanjianController.bunga, text1: "Bunga Maksimal", text2: "6 % per tahun", title: "Bunga", type: 1)
                    SliderViewWithForm(sliderValue: $perjanjianController.tenor, text1: "Tenor Maksimal", text2: "24 bulan", title: "Tenor", type: 2)
                    
                    InputPicker(title: "Metode Pembayaran", listItem: tipeAgunan, selectedItem: $perjanjianController.metodePembayaran)
                    
                    Divider()
//                    FormViewWithInfo(title: "Metode Pembayaran", profileValue: $perjanjianController.metodePembayaran, showButton: true, showButtonInfo: false, info: "", buttonTitle: "Detail").padding(.top, 16).onTapGesture {
//                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
//                    }
                    VStack{
                        FormViewWithInfo(title: "Tanggal Jatuh Tempo", profileValue: $perjanjianController.tanggalJatuhTempo, showButton: false, showButtonInfo: true, info: "Hari pembayaran atau batas waktu pembayaran harus dilakukan oleh peminjam dana (debitur) ke pemberi pinjaman (kreditur).", buttonTitle: "").zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).onTapGesture {
                            showPickerJatuhTempo.toggle()
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                        }
                        if(showPickerJatuhTempo){
                            DatePicker(
                                "",
                                selection: $dateJatuhTempo.onChange(nameChanged),
                                displayedComponents: [.date]
                            )
                            .datePickerStyle(GraphicalDatePickerStyle())
                        }
                        
                        Divider()
                        
                        FormViewWithInfo(title: "Pengadilan Negeri", profileValue: $perjanjianController.pengadilanNegeri, showButton: true, showButtonInfo: true, info: "Pilihan domisili pengadilan negeri untuk upaya hukum penyelesaian perselisihan jika musyawarah tidak berhasil", buttonTitle: "Detail").zIndex(0.9).onTapGesture {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                        }
                        FormViewWithInfo(title: "Tanggal Tanda Tangan", profileValue: $perjanjianController.tanggalTandaTangan, showButton: false, showButtonInfo: true, info: "Hari untuk peminjam dana (debitur) dan pemberi pinjaman (kreditur) bersama menandatangani surat perjanjian.", buttonTitle: "").zIndex(0.8)
                            .onTapGesture {
                                showPickerTandaTangan.toggle()
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                            }
                        if(showPickerTandaTangan){
                            DatePicker(
                                "",
                                selection: $dateTandaTangan.onChange(tandaTanganChanged),
                                displayedComponents: [.date]
                            )
                            .datePickerStyle(GraphicalDatePickerStyle())
                        }
                    }
                    ButtonBordered(icon: "percent", titleButton: "Lihat Simulasi Kredit")
                        .padding(.horizontal)
                    NavigationLink(
                        destination: step4Agunan(masterPresentationMode4 : _masterPresentationMode3 ,step1Redirect: $step1Redirect ,step2Redirect: $step2Redirect, step3Redirect: $step3Redirect),
                        label: {
                            ButtonNext(text: "Lanjutkan", isDataComplete: true).padding(.bottom, 16).padding(.top, 16)
                        }
                    ).simultaneousGesture(TapGesture().onEnded{perjanjianController.setNextButtonState()})
                    
                }
                .navigationBarTitle("Perjanjian Baru", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                                        Button(action: {
                                            self.presentationMode.wrappedValue.dismiss()
                                        }, label: {
                                            HStack{
                                                Image(systemName: "chevron.backward").aspectRatio(contentMode: .fill).foregroundColor(.white)
                                                Text("Kembali").foregroundColor(.white)
                                            }
                                        })
                                    , trailing:
                                        Button("Tutup") {
                                            showActionSheet = true
                                        }.foregroundColor(.white))
                
            }.actionSheet(isPresented: $showActionSheet, content: {
                
                ActionSheet(
                    title: Text("Entri data perjanjian belum lengkap"),
                    buttons: [
                        .default(Text("Simpan")) {
                            perjanjianController.updatePinjamanCoreData(status: StatusSurat.draft)
                            self.masterPresentationMode3.wrappedValue.dismiss()
                        },
                        .destructive(Text("Hapus")) {
                            self.masterPresentationMode3.wrappedValue.dismiss()
                        },
                        .cancel(Text("Batalkan"))
                    ])
                
            })
        }
        
    }
    func nameChanged(to value: Date) {
        showPickerJatuhTempo.toggle()
        perjanjianController.tanggalJatuhTempo = dateFormatter.string(from: value)
    }
    
    func tandaTanganChanged(to value: Date) {
        showPickerTandaTangan.toggle()
        perjanjianController.tanggalTandaTangan = dateFormatter.string(from: value)
    }
}

//struct step3Detail_Previews: PreviewProvider {
//    static var previews: some View {
//        step3Detail()
//    }
//}
