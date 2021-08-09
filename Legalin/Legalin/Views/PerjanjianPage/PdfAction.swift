//
//  PdfAction.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI

struct PdfAction: View {
    var body: some View {
        VStack{
            VStack{
                Image("pdf")
                    .padding(.bottom, 24)
                
                Text("Surat perjanjian hutang - Modal proyek katering - 25/07/2021")
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.horizontal, 24)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
            )
            
            Text("Surat perjanjian hutang anda telah dibuat. Anda dapat mencetak atau menandatanganinya secara digital dengan PrivyID")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.vertical, 32)
                .padding(.horizontal, 32)
            
            Button(action:{
                
            }){
                HStack{
                    Image(systemName: "square.and.arrow.up")
                        .font(.title2)
                        .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                    Text("Bagikan atau Cetak")
                        .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                )
                
            }
            
            List{
                HStack{
                    Text("Tanda Tangan")
                    Spacer()
                    Button(action:{
                        
                    }){
                        Text("Belum")
                            .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                    }
                }
                Toggle(isOn: .constant(false), label: {
                    Text("Pengingat")
                })
            }
            .padding(.top, 76)
            
        }
        .padding()
    }
}

struct PdfAction_Previews: PreviewProvider {
    static var previews: some View {
        PdfAction()
    }
}
