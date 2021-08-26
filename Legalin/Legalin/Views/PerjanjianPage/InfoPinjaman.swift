//
//  InfoPinjaman.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI

struct InfoPinjaman: View {
    
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    @State var pinjaman : Pinjaman
    
    var body: some View {
        ScrollView(showsIndicators: false){
            HStack{
                VStack(alignment: .leading){
                    Text("Detail Pinjaman")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.bottom, 16)
                    
                    VStack(alignment: .leading){
                        Text("Tujuan")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(String(describing: pinjaman.kredit?.namaSimulasi))".capitalized)
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("jumlah pinjaman".capitalized)
                            .font(.footnote)
							.foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text(pinjaman.kredit?.jumlahPinjaman.toRupiahString() ?? "")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Bunga")
                            .font(.footnote)
							.foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(String(describing: pinjaman.kredit?.bunga ?? 0))%".capitalized)
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Tenor")
                            .font(.footnote)
							.foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(String(describing:pinjaman.kredit?.tenor ?? 0)) bulan".capitalized)
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("metode pembayaran".capitalized)
                            .font(.footnote)
							.foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(String(describing: pinjaman.metodePembayaran ?? ""))".capitalized)
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("tanggal pembayaran".capitalized)
                            .font(.footnote)
							.foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(String(describing: pinjaman.metodePembayaran ?? ""))".capitalized)
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("pengadilan negeri".capitalized)
                            .font(.footnote)
							.foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("pengadilan negeri \(String(describing: pinjaman.pengadilanNegeri ?? ""))".capitalized)
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("tanggal tanda tangan".capitalized)
                            .font(.footnote)
							.foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text("\(String(describing: pinjaman.tanggalTandaTangan ?? ""))".capitalized)
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

//struct InfoPinjaman_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoPinjaman()
//    }
//}
