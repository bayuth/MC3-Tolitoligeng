//
//  Pihak2.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI

struct Pihak2: View {
    var body: some View {
        ScrollView{
            HStack{
                VStack(alignment: .leading){
                    Text("Pihak 2 - Peminjam")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.bottom, 16)
                    
                    VStack(alignment: .leading){
                        Text("NIK")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("1234567890098765")
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Nama")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("Debby Anggraini")
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Umur")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("30 Tahun")
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Alamat")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("Jalan Kote")
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Pekerjaan")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("Karyawan Swasta")
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Nomor Handphone")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("081234567890")
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Nama Bank")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("BCA")
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Nomor Rekening")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("1980392103")
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Atas Nama Rekening")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("Yasir Nadem")
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
//            Spacer()
        }
    }
}

struct Pihak2_Previews: PreviewProvider {
    static var previews: some View {
        Pihak2()
    }
}
