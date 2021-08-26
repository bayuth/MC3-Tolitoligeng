//
//  Pihak2.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI

struct Pihak2: View {
    
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    @State var pinjaman : Pinjaman
    
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
                        Text(pinjaman.pihak2?.ktp?.nik ?? "")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Nama")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text(pinjaman.pihak2?.ktp?.nama ?? "")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Umur")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text(calculateAge(date : pinjaman.pihak2?.ktp?.tanggalLahir ?? Date()))
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Alamat")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text(pinjaman.pihak2?.ktp?.alamat ?? "")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Pekerjaan")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text(pinjaman.pihak2?.pekerjaan ?? "")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Nomor Handphone")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text(pinjaman.pihak2?.nomorAktif ?? "")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Nama Bank")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text(pinjaman.pihak2?.namaBank ?? "")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Nomor Rekening")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text(pinjaman.pihak2?.nomorRekening ?? "")
							.foregroundColor(Color("textColor"))
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Atas Nama Rekening")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 1)
                        Text(pinjaman.pihak2?.atasNamaRekening ?? "")
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
    func calculateAge(date : Date) -> String{
        
        let now = Date()
        let birthday: Date = date
        let calendar = Calendar.current

        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        let age = String(ageComponents.year!)
        
        return age
    }
}

//struct Pihak2_Previews: PreviewProvider {
//    static var previews: some View {
//        Pihak2()
//    }
//}
