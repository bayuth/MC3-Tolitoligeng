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
    @State var showActionSheet = false
    @State var showAlert = false
    
    //Validation page redirect
    @Binding var step1Redirect: Bool
    @Binding var step2Redirect: Bool
    @Binding var step3Redirect: Bool
    
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    var tipeAgunan = ["Umum", "Elektronik"]
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                pageIndicator(progressNumber: 4, progressName: "Detail Agunan", progressDetail: "Langkah terakhir")
            }.padding(.vertical)
            .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            
            HStack{
                Toggle(isOn: $perjanjianController.modalAgunanState){ Text("Agunan")
                }.onChange(of: perjanjianController.modalAgunanState, perform: { value in
                    perjanjianController.setNextButtonState()
                })
                .toggleStyle(SwitchToggleStyle(tint: Color("tabBarColor")))
            }.zIndex(0.9)
            .padding(.horizontal)
            
            Divider()
            
            VStack{
                if(perjanjianController.modalAgunanState == true){
                    
                    InputPicker(title: "Tipe Barang", listItem: tipeAgunan, selectedItem: $perjanjianController.tipeBarangAgunan)
                    
                    
                    Divider()
                    
                    //                    inputToModal(title: "Tipe Barang", textViewValue: "Tipe Barang", tipeAgunan: $perjanjianController.tipeBarangAgunan, isPresented: false)
                    
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
            .simultaneousGesture(TapGesture().onEnded{
                
                if perjanjianController.nextButtonState == false{
                    showAlert = true
                }
                
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Data belum lengkap"),
                      message: Text("Mohon lengkapi data terlebih dahulu untuk melanjutkan"),
                      dismissButton: .destructive(Text("Tutup")){
                        
                        if perjanjianController.redirectPage == "step1"{
                            step1Redirect = false
                        } else if perjanjianController.redirectPage == "step2"{
                            step2Redirect = false
                        } else if perjanjianController.redirectPage == "step3"{
                            step3Redirect = false
                        }
                        
                      } )
            }).padding(.bottom,13)
            
            
        }
//        .frame(width: UIScreen.main.bounds.width - 35,alignment: .leading)
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
        .actionSheet(isPresented: $showActionSheet, content: {
            
            ActionSheet(
                title: Text("Entri data perjanjian belum lengkap"),
                buttons: [
                    .default(Text("Simpan")) {
						perjanjianController.setPihak1OpenCamToFalse(isOpenCam: false)
						perjanjianController.setPihak2OpenCamToFalse(isOpenCam: false)
                        perjanjianController.updatePinjamanCoreData(status: StatusSurat.draft)
                        self.masterPresentationMode4.wrappedValue.dismiss()
                    },
                    .destructive(Text("Hapus")) {
						perjanjianController.setPihak1OpenCamToFalse(isOpenCam: false)
						perjanjianController.setPihak2OpenCamToFalse(isOpenCam: false)
                        self.masterPresentationMode4.wrappedValue.dismiss()
                    },
                    .cancel(Text("Batalkan"))
                ])
            
        })
    }
}

//struct step4Agunan_Previews: PreviewProvider {
//    static var previews: some View {
//        step4Agunan()
//    }
//}
