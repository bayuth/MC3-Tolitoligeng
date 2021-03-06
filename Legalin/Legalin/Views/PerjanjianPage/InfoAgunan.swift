//
//  InfoAgunan.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI

struct InfoAgunan: View {
    var hideButton : Bool
    @Environment(\.presentationMode) var masterPresentationMode6
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    @ObservedObject var coreDataVM: CoreDataViewModel = .shared
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                VStack(alignment: .leading){
                    Text("Agunan")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.bottom, 16)
                    
                    VStack(alignment: .leading){
                        Text("Nama Barang")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text(getAgunanValue(item: perjanjianController.namaBarang))
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("warna".capitalized)
                            .font(.footnote)
							.foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text(getAgunanValue(item: perjanjianController.warnaBarang).capitalized)
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("harga".capitalized)
                            .font(.footnote)
							.foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text(getStringFromDouble(item: getDoubleAgunanValue(item: perjanjianController.hargaBarang)))
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("nomor seri".capitalized)
                            .font(.footnote)
							.foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text(getAgunanValue(item: perjanjianController.nomorSeri))
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                }
                .padding()
                Spacer()
            }
            
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("tabBarColor"))
            )
            .padding(.horizontal)
            .padding(.vertical, 16)
            
            if hideButton == true{
                
            }
            else{
                NavigationLink(
                    destination: GeneratePDF()){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Preview")
                                .font(.subheadline)
                                .foregroundColor(Color("textColor"))
                            Text("PDF")
                                .font(.caption2)
                                .foregroundColor(Color("labelColor"))
                            Text("256 KB")
                                .font(.caption2)
                                .foregroundColor(Color("labelColor"))
                        }
                        .padding(16)
                        Spacer()
                        Image("pdf2")
                            .padding(16)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color("tabBarColor"))
                    )
                    .padding(.horizontal)
                }
            }
            Spacer()
            
            if hideButton == true{
                
            }else{
                NavigationLink(
                    destination: loadingScreen(masterPresentationMode7: _masterPresentationMode6),
                    label: {
                        Text("Buat Surat")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                    })
                    .simultaneousGesture(TapGesture().onEnded{
                        
                        if (perjanjianController.sender == "perjanjianBaru"){
                        perjanjianController.updatePinjamanCoreData(pinjaman: coreDataVM.createPinjaman(), status: StatusSurat.notSigned)
                        } else {
                            perjanjianController.updatePinjamanCoreData(pinjaman: perjanjianController.detailPinjaman!, status: StatusSurat.notSigned)
                        }
                        
						perjanjianController.setPihak1OpenCamToFalse(isOpenCam: false)
						perjanjianController.setPihak2OpenCamToFalse(isOpenCam: false)
					})
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color("tabBarColor"))
                    .specCornerRadius(8, corners: .allCorners)
                    .padding()
                    .padding(.bottom,30)
            }
        }
        
    }
    func getAgunanValue(item: String) -> String {
        if item == "" {
            return "-"
        } else {
            return item
        }
    }
    
    func getDoubleAgunanValue(item: String) -> Double {
        if item == "" {
            return 0
        } else {
            return Double(item) ?? 0
        }
    }
    
    func getStringFromDouble(item: Double) -> String{
        if item == 0 {
            return "-"
        } else {
            return item.toRupiahString()
        }
    }
}

//struct InfoAgunan_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoAgunan(hideButton: true)
//    }
//}
