//
//  Pihak2.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI

struct Pihak2: View {
    
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    var body: some View {
        ScrollView(showsIndicators: false){
            HStack{
                VStack(alignment: .leading){
                    Text("Pihak 2 - Peminjam")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.bottom, 16)
                    
                    VStack(alignment: .leading){
                        Text("NIK")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak2NIK)")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Nama")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak2Nama)")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Umur")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak2TanggalLahir)")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Alamat")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak2Alamat)")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Pekerjaan")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak2Pekerjaan)")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Nomor Handphone")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak2NomorHP)")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Nama Bank")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak2NamaBank)")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Nomor Rekening")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak2NomorRekening)")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Atas Nama Rekening")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak2AtasNamaRekening)")
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
            .padding()
//            Spacer()
        }
    }
}

struct Pihak2_Previews: PreviewProvider {
    static var previews: some View {
        Pihak2()
    }
}
