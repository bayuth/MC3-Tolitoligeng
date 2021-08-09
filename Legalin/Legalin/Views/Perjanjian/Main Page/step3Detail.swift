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
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                pageIndicator(progressNumber: 3, progressName: "Detail Pinjaman", progressDetail: "Berikutnya: Agunan").padding(.bottom, 15)
                FormView(title: "Tujuan Peminjaman", profileValue: $tujuanPeminjaman, keyboardNum: false)
                SliderViewWithForm(text1: "Pinjaman Maksimal", text2: "Rp 50000000", title: "Jumlah Pinjaman", type: 0)
                SliderViewWithForm(text1: "Bunga Maksimal", text2: "6 % per tahun", title: "Bunga", type: 1)
                SliderViewWithForm(text1: "Tenor Maksimal", text2: "24 bulan", title: "Tenor", type: 2)
                FormViewWithInfo(title: "Metode Pembayaran", profileValue: "Metode Pembayaran", showButton: true, showButtonInfo: false, info: "", buttonTitle: "Detail").padding(.top, 16)
                FormViewWithInfo(title: "Tanggal Jatuh Tempo", profileValue: "Pilih tanggal", showButton: false, showButtonInfo: true, info: "Hari pembayaran atau batas waktu pembayaran harus dilakukan oleh peminjam dana (debitur) ke pemberi pinjaman (kreditur).", buttonTitle: "")
                FormViewWithInfo(title: "Pengadilan Negeri", profileValue: "Pengadilan Negeri", showButton: true, showButtonInfo: true, info: "Pilihan domisili pengadilan negeri untuk upaya hukum penyelesaian perselisihan jika musyawarah tidak berhasil", buttonTitle: "Detail")
                FormViewWithInfo(title: "Tanggal Tanda Tangan", profileValue: "Pilih tanggal", showButton: false, showButtonInfo: true, info: "Hari untuk peminjam dana (debitur) dan pemberi pinjaman (kreditur) bersama menandatangani surat perjanjian.", buttonTitle: "")
                ButtonNext(text: "Lanjutkan", isDataComplete: true)
            }.frame(width: UIScreen.main.bounds.width - 35,
                    alignment: .leading)
        }
    }
}

struct step3Detail_Previews: PreviewProvider {
    static var previews: some View {
        step3Detail()
    }
}
