//
//  KreditCardView.swift
//  Legalin
//
//  Created by Achmad Fathullah on 05/08/21.
//

import SwiftUI

struct KreditCardView: View {
    var item: Kredit
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Text(item.namaSimulasi ?? "")
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
                        
                        Text(item.jumlahPinjaman.toRupiahString())
							.foregroundColor(Color("textColor"))
                            .padding(.bottom, 8)
                        
                        Text("Bunga")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 2)
                        
                        Text("\(String(format: "%.2f", item.bunga))%")
							.foregroundColor(Color("textColor"))
                            .padding(.bottom, 8)
                        
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading){
                        Text("Tenor")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 2)
                        
                        Text("\(Int(item.tenor)) bulan")
							.foregroundColor(Color("textColor"))
                            .padding(.bottom, 8)
                        
                        Text("Cicilan Perbulan")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 2)
                        
                        Text("\(generateCicilanPerbulan().toRupiahString())")
							.foregroundColor(Color("textColor"))
                            .padding(.bottom, 8)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
                    
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color("cardColor"))
            )
        }
    }
    
    func generateTotalBunga() -> Double {
        return (item.bunga / 100) / 12 * item.tenor
    }
    
    func generateTotalPinjaman() -> Double {
        return item.jumlahPinjaman * (1 + generateTotalBunga())
    }
    
    func generateCicilanPerbulan() -> Double {
        return generateTotalPinjaman() / item.tenor
    }
    
    
    
}
