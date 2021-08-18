//
//  ModalAddKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 06/08/21.
//

import SwiftUI



struct ModalAddKredit: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var kreditData = ListKreditVM()
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack{
                    FormView(title: "Tujuan Meminjam", profileValue: $kreditData.object.kreditTitle, keyboardNum: false).padding(.horizontal, 16).padding(.top, 16)
                    SliderViewWithForm(sliderValue: $perjanjianController.jumlahPinjaman, text1: "Pinjaman Maksimal", text2: "Rp. 50.000.000", title: "Jumlah Pinjaman", type: 0).padding(.horizontal, 16)
                    SliderViewWithForm(sliderValue: $perjanjianController.bunga, text1: "Bunga Maksimal", text2: "6 %", title: "Bunga", type: 1).padding(.horizontal, 16)
                    SliderViewWithForm(sliderValue: $perjanjianController.tenor, text1: "Tenor Maksimal Maksimal", text2: "24 Bulan", title: "Tenor", type: 2).padding(.horizontal, 16)
                }
                NavigationLink(
                    destination: UlasanKredit(),
                    label: {
                        Text("Simulasikan").font(.body).fontWeight(.bold).foregroundColor(.white).multilineTextAlignment(.center).padding(.vertical,15).padding(.horizontal,120).background(Color(#colorLiteral(red: 0, green: 0.2837583721, blue: 0.423648268, alpha: 1))).cornerRadius(10)
                    }).padding(.top,10).padding(.bottom, 16)
            }
            .navigationBarTitle("Kredit Baru", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button("Tutup", action: {
                                        presentationMode.wrappedValue.dismiss()
                                    })
                                    .foregroundColor(Color.init(hex: "#E6FFFFFF"))
            )
        }
    }
}


