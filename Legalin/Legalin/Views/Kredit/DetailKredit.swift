//
//  DetailKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 25/08/21.
//

import SwiftUI

struct DetailKredit: View {
    @Environment(\.presentationMode) var presentationMode
    var dataUlasan :ListKreditVM
    var index: Int
    var body: some View {
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
                        Text("\(dataUlasan.object.bunga) %".capitalized)
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading){
                        Text("Tenor".capitalized)
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 1)
                        Text("\(Int(dataUlasan.object.tenor)) Bulan".capitalized)
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
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Buat Perjanjian")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(Font.body.bold())
                    .padding(.all , 12)
                    .foregroundColor(Color.white)
                    .background(Color.init(hex: "104769"))
                    .cornerRadius(8)
            }
            .padding(.bottom)
            .padding(.horizontal)
        }
        .onAppear(perform: {
            setupAppearance()
        })
        .navigationBarTitle("Ulasan Kredit", displayMode: .inline)
        .navigationBarItems(trailing:
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.white)
                                })
        )
        .onDisappear(perform: {
            dataUlasan.deleteDetailKredit(index: index)
//            dataUlasan.fillListDone() -> this will make crash
        })
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
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = #colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}


