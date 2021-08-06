//
//  InfoAgunan.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI

struct InfoAgunan: View {
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
                        Text("macbook pro 16'' 2019 2,4Ghz 8-core intel core i9 RAM 32GB ")
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("warna".capitalized)
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("space grey".capitalized)
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("harga".capitalized)
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("Rp 35.000.000".capitalized)
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("nomor seri".capitalized)
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("C02DV15AM6R")
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

struct InfoAgunan_Previews: PreviewProvider {
    static var previews: some View {
        InfoAgunan()
    }
}
