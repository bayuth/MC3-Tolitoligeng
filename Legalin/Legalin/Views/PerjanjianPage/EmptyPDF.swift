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
                .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                .padding(.top, 48)
                .padding(.bottom, 24)
            Text("Selesaikan memenuhi formulir perjanjian untuk membuat Surat Perjanjian Hutang")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                .padding(.horizontal, 32)
        }
    }
}

struct EmptyPDF_Previews: PreviewProvider {
    static var previews: some View {
        EmptyPDF()
    }
}
