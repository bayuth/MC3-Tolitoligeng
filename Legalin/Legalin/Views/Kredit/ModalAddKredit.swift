//
//  ModalAddKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 06/08/21.
//

import SwiftUI



struct ModalAddKredit: View {
    @Environment(\.presentationMode) var masterPresentationModalAdd
    @ObservedObject private var kreditData = ListKreditVM()
    @ObservedObject private var perjanjianController: PerjanjianController = .shared
	@State private var isDisable:Bool = false
    
    var body: some View {
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                VStack{
					FormView(title: "Tujuan Meminjam", profileValue: $kreditData.object.kreditTitle, keyboardNum: false, isDisable: $isDisable).padding(.horizontal, 16).padding(.top, 16)
                    SliderViewWithForm(sliderValue: $kreditData.object.jumlahPinjaman, text1: "Pinjaman Maksimal", text2: "Rp. 50.000.000", title: "Jumlah Pinjaman", type: 0).padding(.horizontal, 16)
                    SliderViewWithForm(sliderValue: $kreditData.object.bunga, text1: "Bunga Maksimal", text2: "6 %", title: "Bunga", type: 1).padding(.horizontal, 16)
                    SliderViewWithForm(sliderValue: $kreditData.object.tenor, text1: "Tenor Maksimal Maksimal", text2: "24 Bulan", title: "Tenor", type: 2).padding(.horizontal, 16)
                }
                if !kreditData.hasNilField(){
                    NavigationLink(
                        destination: UlasanKredit(presentationMode: _masterPresentationModalAdd, dataUlasan: kreditData),
                        label: {
                            Text("Simulasikan").font(.body).fontWeight(.bold).foregroundColor(.white).multilineTextAlignment(.center).padding(.vertical,15).padding(.horizontal,120).background(Color(#colorLiteral(red: 0, green: 0.2837583721, blue: 0.423648268, alpha: 1))).cornerRadius(10)
                        }).padding(.top,10).padding(.bottom, 16)
                }else{
                    Button(action: {
                            //
                    }) {
                        Text("Simulasikan")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(Font.body.bold())
                            .padding(.all , 12)
                            .foregroundColor(Color.white)
                            .background(Color.init(hex: "104769"))
                            .cornerRadius(8)
                    }.padding(.all, 18)
                }
                
            }
            .navigationBarTitle("Kredit Baru", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button("Tutup", action: {
                                        masterPresentationModalAdd.wrappedValue.dismiss()
                                    })
                                    .foregroundColor(Color.init(hex: "#E6FFFFFF"))
            )
        }
    }
}


