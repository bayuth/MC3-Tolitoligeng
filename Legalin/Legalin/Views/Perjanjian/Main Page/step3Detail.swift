//
//  step3Detail.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct step3Detail: View {
    @State var tujuanPeminjaman = ""
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
                pageIndicator(progressNumber: 3, progressName: "Detail Pinjaman", progressDetail: "Berikutnya: Agunan").padding(.bottom, 15)
                FormView(title: "Tujuan Peminjaman", profileValue: $tujuanPeminjaman, keyboardNum: false)
                SliderViewWithForm(text1: "Pinjaman Maksimal", text2: "Rp 50000000", title: "Jumlah Pinjaman", type: 0)
                SliderViewWithForm(text1: "Bunga Maksimal", text2: "6 % per tahun", title: "Bunga", type: 1)
                SliderViewWithForm(text1: "Tenor Maksimal", text2: "24 bulan", title: "Tenor", type: 2)
                
                ButtonNext(text: "Lanjutkan", isDataComplete: true)
                Spacer()
                
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
