//
//  EmptyPDF.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 11/08/21.
//

import SwiftUI

struct EmptyPDF: View {
    var body: some View {
        VStack{
            Image("Letter Empty")
            Text("surat Belum Terbuat")
                .font(.headline)
                .foregroundColor(Color("textColor"))
                .padding(.top, 48)
                .padding(.bottom, 24)
            Text("Selesaikan memenuhi formulir perjanjian untuk membuat Surat Perjanjian Hutang")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("textColor"))
                .padding(.horizontal, 32)
        }
    }
}

struct EmptyPDF_Previews: PreviewProvider {
    static var previews: some View {
        EmptyPDF()
    }
}
