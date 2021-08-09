//
//  step3Detail.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct step3Detail: View {
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
    
    @EnvironmentObject var perjanjianController: PerjanjianController
    
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df
    }()
    @State private var valueDateJatuhTempo = "Pilih tanggal"
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                pageIndicator(progressNumber: 3, progressName: "Detail Pinjaman", progressDetail: "Berikutnya: Agunan").padding(.bottom, 15).padding(.top,25)
                FormView(title: "Tujuan Peminjaman", profileValue: $tujuanPeminjaman, keyboardNum: false)
                SliderViewWithForm(text1: "Pinjaman Maksimal", text2: "Rp 50000000", title: "Jumlah Pinjaman", type: 0)
                SliderViewWithForm(text1: "Bunga Maksimal", text2: "6 % per tahun", title: "Bunga", type: 1)
                SliderViewWithForm(text1: "Tenor Maksimal", text2: "24 bulan", title: "Tenor", type: 2)
                FormViewWithInfo(title: "Metode Pembayaran", profileValue: $perjanjianController.metodePembayaran, showButton: true, showButtonInfo: false, info: "", buttonTitle: "Detail").padding(.top, 16)
                VStack{
                    FormViewWithInfo(title: "Tanggal Jatuh Tempo", profileValue: $title1, showButton: false, showButtonInfo: true, info: "Hari pembayaran atau batas waktu pembayaran harus dilakukan oleh peminjam dana (debitur) ke pemberi pinjaman (kreditur).", buttonTitle: "").zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).onTapGesture {
                        showPickerJatuhTempo.toggle()
                    }
                    if(showPickerJatuhTempo){
                        DatePicker(
                            "",
                            selection: $dateJatuhTempo.onChange(nameChanged),
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(GraphicalDatePickerStyle())
                    }
                    
                    FormViewWithInfo(title: "Pengadilan Negeri", profileValue: $perjanjianController.pengadilanNegeri, showButton: true, showButtonInfo: true, info: "Pilihan domisili pengadilan negeri untuk upaya hukum penyelesaian perselisihan jika musyawarah tidak berhasil", buttonTitle: "Detail").zIndex(0.9)
                    FormViewWithInfo(title: "Tanggal Tanda Tangan", profileValue: $title3, showButton: false, showButtonInfo: true, info: "Hari untuk peminjam dana (debitur) dan pemberi pinjaman (kreditur) bersama menandatangani surat perjanjian.", buttonTitle: "").zIndex(0.8)
                        .onTapGesture {
                            showPickerTandaTangan.toggle()
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
                
                NavigationLink(
                    destination: step4Agunan(),
                    label: {
                        ButtonNext(text: "Lanjutkan", isDataComplete: true).padding(.bottom, 16).padding(.top, 64)
                    }).navigationBarTitle("Perjanjian Baru", displayMode: .inline)
                
            }.frame(width: UIScreen.main.bounds.width - 35,
                    alignment: .leading)
            
        }
    }
    func nameChanged(to value: Date) {
        showPickerJatuhTempo.toggle()
        title1 = dateFormatter.string(from: value)
    }
    
    func tandaTanganChanged(to value: Date) {
        showPickerTandaTangan.toggle()
        title3 = dateFormatter.string(from: value)
    }
}

struct step3Detail_Previews: PreviewProvider {
    static var previews: some View {
        step3Detail()
    }
}
