//
//  InfoPinjaman.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI

struct InfoPinjaman: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                VStack(alignment: .leading){
                    Text("Detail Pinjaman")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.bottom, 16)
                    
                    VStack(alignment: .leading){
                        Text("Tujuan")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("Modal proyek katering".capitalized)
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("jumlah pinjaman".capitalized)
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("Rp 25.000.000".capitalized)
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Bunga")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("3%".capitalized)
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Tenor")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("12 bulan".capitalized)
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("metode pembayaran".capitalized)
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("Cicilan".capitalized)
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("tanggal pembayaran".capitalized)
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("15".capitalized)
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("pengadilan negeri".capitalized)
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("pengadilan negeri jakarta selatan".capitalized)
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("tanggal tanda tangan".capitalized)
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("12 agustus 2021".capitalized)
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
            .padding()
            Spacer()
        }
    }
}

struct InfoPinjaman_Previews: PreviewProvider {
    static var previews: some View {
        InfoPinjaman()
    }
}
