//
//  AgreementCardView.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 02/08/21.
//

import SwiftUI

struct AgreementCardView: View {
    
    var item: Pinjaman
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Text(item.kredit?.namaSimulasi ?? "")
                    .foregroundColor(Color("textColor"))
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top, 16)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Jumlah Pinjaman")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 2)

                        Text(item.kredit?.jumlahPinjaman.toRupiahString() ?? "")
                            .foregroundColor(Color("textColor"))
                            .padding(.bottom, 8)
                        
                        Text("Tanggal Pembuatan")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 2)
                        
							
                        Text(getDateString(inputDate: item.dateModified ?? Date()))
                            .foregroundColor(Color("textColor"))
                            .padding(.bottom, 8)
                        
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading){
                        Text("Pemberi Pinjaman")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 2)
                        
							
                        Text(item.pihak2?.ktp?.nama ?? "")
                            .foregroundColor(Color("textColor"))
                            .padding(.bottom, 8)
                        
                        Text("Status Tanda Tangan")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 2)
                        
                        Text("Belum")
							.foregroundColor(Color("textColor"))
                        Text(item.status ?? "")
                            .padding(.bottom, 8)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
                
            }
            }
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color("cardColor"))
            )
        }
    }
}


