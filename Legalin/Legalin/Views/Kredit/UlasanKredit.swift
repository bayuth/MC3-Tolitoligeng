//
//  UlasanKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 11/08/21.
//

import SwiftUI

struct UlasanKredit: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
//        NavigationView {
            ScrollView(showsIndicators: false){
                VStack {
                    HStack{
                        VStack(alignment: .leading){
                            Text("Agunan")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.bottom, 16)
                            
                            VStack(alignment: .leading){
                                Text("Jumlah Pinjaman")
                                    .font(.footnote)
                                    .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                    .padding(.bottom, 1)
                                Text("Rp. 40.000.000")
                            }
                            .padding(.bottom, 8)
                            
                            VStack(alignment: .leading){
                                Text("Bunga".capitalized)
                                    .font(.footnote)
                                    .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                    .padding(.bottom, 1)
                                Text("6 %".capitalized)
                            }
                            .padding(.bottom, 8)
                            
                            VStack(alignment: .leading){
                                Text("Tenor".capitalized)
                                    .font(.footnote)
                                    .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                    .padding(.bottom, 1)
                                Text("12 Bulan".capitalized)
                            }
                            .padding(.bottom, 8)
                            
                            VStack(alignment: .leading){
                                Text("Cicilan Setiap Bulan".capitalized)
                                    .font(.footnote)
                                    .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                    .padding(.bottom, 1)
                                Text("Rp. 2.000.000")
                            }
                            .padding(.bottom, 8)
                            VStack(alignment: .leading){
                                Text("Total Pengembalian".capitalized)
                                    .font(.footnote)
                                    .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                    .padding(.bottom, 1)
                                Text("Rp. 2.000.000")
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
                    Button(action: {
                            presentationMode.wrappedValue.dismiss()                      }) {
                        Text("Simulasikan")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(Font.body.bold())
                            .padding(.all , 12)
                            .foregroundColor(Color.white)
                            .background(Color.init(hex: "104769"))
                            .cornerRadius(8)
                    }.padding(.all, 18)
                    Button(action: {
                            presentationMode.wrappedValue.dismiss()                      }) {
                        Text("Buat Perjanjian")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.body)
                            .padding(.all , 12)
                            .foregroundColor(Color.init(hex: "104769"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.init(hex: "104769"), lineWidth: 1)
                            )
                    }.padding(.horizontal, 18)
                }
                
                
            }
            .navigationBarTitle("Ulasan Kredit", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "chevron.left")
                                            .foregroundColor(.white)
                                        Text("Perjanjian")
                                            .foregroundColor(.white)
                                    })
            )
//        }
    }
}

struct UlasanKredit_Previews: PreviewProvider {
    static var previews: some View {
        UlasanKredit()
    }
}
