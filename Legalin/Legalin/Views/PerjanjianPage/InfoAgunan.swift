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
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.namaBarang)")
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("warna".capitalized)
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("\(String(describing: perjanjianController.warnaBarang ?? ""))".capitalized)
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("harga".capitalized)
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("Rp \(String(describing: perjanjianController.hargaBarang ?? ""))".capitalized)
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("nomor seri".capitalized)
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.nomorSeri)")
                    }
                    .padding(.bottom, 8)
                }
                .padding()
                Spacer()
            }
            
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
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
                                .foregroundColor(.black)
                            Text("PDF")
                                .font(.caption2)
                                .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            Text("256 KB")
                                .font(.caption2)
                                .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                        }
                        .padding(16)
                        Spacer()
                        Image("pdf2")
                            .padding(16)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
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
                    .simultaneousGesture(TapGesture().onEnded{perjanjianController.updatePinjamanCoreData(status: StatusSurat.notSigned)})
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                    .specCornerRadius(8, corners: .allCorners)
                    .padding()
                    .padding(.bottom,30)
            }
        }
        
        
    }
}

struct InfoAgunan_Previews: PreviewProvider {
    static var previews: some View {
        InfoAgunan(hideButton: true)
    }
}
