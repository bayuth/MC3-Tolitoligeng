//
//  Pihak1.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI

struct Pihak1: View {
    
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    var body: some View {
        ScrollView(showsIndicators: false){
            HStack{
                VStack(alignment: .leading){
                    Text("Pihak 1 - Peminjam")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.bottom, 16)
                    
                    VStack(alignment: .leading){
                        Text("NIK")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak1NIK)")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Nama")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak1Nama)")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Umur")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak1TanggalLahir)")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Alamat")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak1Alamat)")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Pekerjaan")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak1Pekerjaan)")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Nomor Handphone")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(perjanjianController.pihak1NomorHP)")
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
        }
    }
}

struct Pihak1_Previews: PreviewProvider {
    static var previews: some View {
        Pihak1()
    }
}
