//
//  ModalSimulasiKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 23/08/21.
//

import SwiftUI

struct ModalSimulasiKredit: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresented: Bool
    @State var object: ItemListKredit
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack {
                HStack{
                    VStack(alignment: .leading){
                        Text(object.kreditTitle)
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.bottom, 16)
                        
                        VStack(alignment: .leading){
                            Text("Jumlah Pinjaman")
                                .font(.footnote)
                                .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                .padding(.bottom, 1)
                            Text(object.jumlahPinjaman.toRupiahString() == "NaN" ? "Rp0" : object.jumlahPinjaman.toRupiahString())
                        }
                        .padding(.bottom, 8)
                        
                        VStack(alignment: .leading){
                            Text("Bunga".capitalized)
                                .font(.footnote)
                                .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                .padding(.bottom, 1)
                            Text("\(String(format: "%.2f", object.bunga))%".capitalized)
                        }
                        .padding(.bottom, 8)
                        
                        VStack(alignment: .leading){
                            Text("Tenor".capitalized)
                                .font(.footnote)
                                .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                .padding(.bottom, 1)
                            Text("\(Int(object.tenor)) Bulan".capitalized)
                        }
                        .padding(.bottom, 8)
                        
                        VStack(alignment: .leading){
                            Text("Cicilan Setiap Bulan".capitalized)
                                .font(.footnote)
                                .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                .padding(.bottom, 1)
                            Text(generateCicilanPerbulan().toRupiahString() == "NaN" ? "Rp0" : generateCicilanPerbulan().toRupiahString())
                        }
                        .padding(.bottom, 8)
                        VStack(alignment: .leading){
                            Text("Total Pengembalian".capitalized)
                                .font(.footnote)
                                .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                                .padding(.bottom, 1)
                            Text(generateTotalPinjaman().toRupiahString() == "NaN" ? "Rp0" : generateTotalPinjaman().toRupiahString())
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
                .navigationBarTitle("Simulasi Kredit", displayMode: .inline)
                .accentColor(.red)
                .navigationBarBackButtonHidden(true)
                
            } .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Done")
                        .foregroundColor(.white)
                        .onTapGesture {
                            isPresented = false
                        }
                }
            }
            
            
        }
    }
    
    func generateTotalBunga() -> Double {
        return (object.bunga / 100) / 12 * object.tenor
    }
    
    func generateTotalPinjaman() -> Double {
        return object.jumlahPinjaman * (1 + generateTotalBunga())
    }
    
    func generateCicilanPerbulan() -> Double {
        return generateTotalPinjaman() / object.tenor
    }
}
