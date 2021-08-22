//
//  UlasanKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 11/08/21.
//

import SwiftUI

struct UlasanKredit: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var dataUlasan :ListKreditVM
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack {
                HStack{
                    VStack(alignment: .leading){
                        Text(dataUlasan.object.kreditTitle)
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.bottom, 16)
                        
                        VStack(alignment: .leading){
                            Text("Jumlah Pinjaman")
                                .font(.footnote)
                                .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                .padding(.bottom, 1)
                            Text(dataUlasan.object.jumlahPinjaman.toRupiahString())
                        }
                        .padding(.bottom, 8)
                        
                        VStack(alignment: .leading){
                            Text("Bunga".capitalized)
                                .font(.footnote)
                                .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                .padding(.bottom, 1)
                            Text("\(Int(dataUlasan.object.bunga)) %".capitalized)
                        }
                        .padding(.bottom, 8)
                        
                        VStack(alignment: .leading){
                            Text("Tenor".capitalized)
                                .font(.footnote)
                                .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                .padding(.bottom, 1)
                            Text("\(String(describing: dataUlasan.object.tenor)) Bulan".capitalized)
                        }
                        .padding(.bottom, 8)
                        
                        VStack(alignment: .leading){
                            Text("Cicilan Setiap Bulan".capitalized)
                                .font(.footnote)
                                .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                .padding(.bottom, 1)
                            Text(generateCicilanPerbulan().toRupiahString())
                        }
                        .padding(.bottom, 8)
                        VStack(alignment: .leading){
                            Text("Total Pengembalian".capitalized)
                                .font(.footnote)
                                .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                .padding(.bottom, 1)
                            Text(generateTotalPinjaman().toRupiahString())
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
                Button(action: {
                    dataUlasan.addNewDataCredit(itemListKredit: dataUlasan.object)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Selesai")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(Font.body.bold())
                        .padding(.all , 12)
                        .foregroundColor(Color.white)
                        .background(Color.init(hex: "104769"))
                        .cornerRadius(8)
                }
                .padding(.bottom, 8)
                .padding(.horizontal)
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Text("Buat Perjanjian")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.body)
                        .padding(.all , 12)
                        .foregroundColor(Color.init(hex: "104769"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.init(hex: "104769"), lineWidth: 1)
                        )
                }
                .padding(.horizontal)
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
        
        
    }
    /*
     Total Bunga : (Bunga%/12 x Tenor)
     Total Pinjaman : Jumlah Pinjaman x (1 + Total Bunga)
     Cicilan Angsuran : Total Pinjaman / Tenor
     */
    
    func generateTotalBunga() -> Double {
        return (dataUlasan.object.bunga / 100) / 12 * dataUlasan.object.tenor
    }
    
    func generateTotalPinjaman() -> Double {
        return dataUlasan.object.jumlahPinjaman * (1 + generateTotalBunga())
    }
    
    func generateCicilanPerbulan() -> Double {
        return generateTotalPinjaman() / dataUlasan.object.tenor
    }
}


