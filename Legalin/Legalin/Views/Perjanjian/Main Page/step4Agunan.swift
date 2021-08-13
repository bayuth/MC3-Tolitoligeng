//
//  step4Agunan.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct step4Agunan: View {
    
    @Environment(\.presentationMode) var masterPresentationMode4
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var toggleState: Bool = false
    @State var disabledStaus: Bool = false
    @State var showAlert: Bool = false
    
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                pageIndicator(progressNumber: 4, progressName: "Detail Agunan", progressDetail: "Langkah terakhir")
            }.padding(.vertical, 15)
            .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            
            HStack{
                Toggle(isOn: $perjanjianController.modalAgunanState){ Text("Agunan")
                }.onChange(of: perjanjianController.modalAgunanState, perform: { value in
                    print(value)
                    perjanjianController.setNextButtonState()
                })
                .toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))))
            }.zIndex(0.9)
            
            Divider().padding(.horizontal, -20)
            
            VStack{
                if(perjanjianController.modalAgunanState == true){
                    
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
            
            NavigationLink(
                destination: ConfirmationPage(masterPresentationMode5: _masterPresentationMode4)){
                ButtonNext(text: "Buat Surat", isDataComplete: perjanjianController.nextButtonState)
            }.disabled(!perjanjianController.nextButtonState)
            
        }.frame(width: UIScreen.main.bounds.width - 35,
                alignment: .leading)
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
                                    showAlert = true
                                }.foregroundColor(.white)).alert(isPresented: $showAlert, content: {
                                    
                                    Alert(title: Text("Simpan Draft"),
                                          message: Text("Apakah anda ingin menyimpan draft?"),
                                          primaryButton:
                                            .destructive(Text("Hapus")){
                                                masterPresentationMode4.wrappedValue.dismiss()
                                                        },
                                          secondaryButton:
                                            .cancel(Text("Simpan")) {
                                                masterPresentationMode4.wrappedValue.dismiss()
                                          })
                                    
                                })
        
    }
}

struct step4Agunan_Previews: PreviewProvider {
    static var previews: some View {
        step4Agunan()
    }
}

//extension UINavigationController{
//    override open func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let appearance = UINavigationBarAppearance()
//        appearance.backgroundColor = UIColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
//        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        
//        navigationBar.standardAppearance = appearance
//    }
//}
