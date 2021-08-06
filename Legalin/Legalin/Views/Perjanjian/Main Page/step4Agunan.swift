//
//  step4Agunan.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct step4Agunan: View {
    
    @State var toggleState: Bool = false
    
    @StateObject var perjanjianController = PerjanjianController()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                
                HStack{
                pageIndicator(progressNumber: 4, progressName: "Detail Agunan", progressDetail: "Langkah terakhir")
                }.padding(.vertical, 15)
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                
                HStack{
                    Toggle(isOn: $toggleState, label: {
                        Text("Agunan")
                    }).toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))))
                }.zIndex(0.9)
                
                Divider().padding(.horizontal, -20)
                
                VStack{
                    if (toggleState == true){
                        
                        inputToModal(title: "Tipe Barang", textViewValue: "Tipe Barang", tipeAgunan: $perjanjianController.tipeBarangAgunan, isPresented: false)
                        
                        if(perjanjianController.tipeBarangAgunan != "Detail"){
                        
                            inputTextViewCell(title: "Nama Barang",textViewValue: $perjanjianController.namaBarang, keyboardNum: false, emptyStateString: "Isi dengan rinci dan detail")
                            
                            inputTextViewCell(title: "Warna Barang",textViewValue: $perjanjianController.warnaBarang, keyboardNum: false, emptyStateString: "Warna barang")
                            
                            inputTextViewCell(title: "Harga Barang",textViewValue: $perjanjianController.hargaBarang, keyboardNum: true, emptyStateString: "Harga barang terkini (co: Rp 2.500.000")
                            
                            if(perjanjianController.tipeBarangAgunan != "Elektronik"){
                                inputTextViewCell(title: "Nomor Seri Opsional",textViewValue: $perjanjianController.nomorSeri, keyboardNum: false, emptyStateString: "Opsional jika ada nomor seri")
                            } else{
                                inputTextViewCell(title: "Nomor Seri",textViewValue: $perjanjianController.nomorSeri, keyboardNum: false, emptyStateString: "Nomor seri barang elektronik")
                            }
                            
                            
                        }
                    }
                }
                Spacer()
                
                ButtonNext(text: "Buat Surat")
                
        }.frame(width: UIScreen.main.bounds.width - 35,
                alignment: .leading)
            .navigationBarTitle("Buat Perjanjian", displayMode: .inline)
            
        }
    }
}

struct step4Agunan_Previews: PreviewProvider {
    static var previews: some View {
        step4Agunan()
    }
}