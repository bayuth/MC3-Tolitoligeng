//
//  step2Pemberi.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct step2Pemberi: View {
    var body: some View {
        VStack(alignment: .leading){
            
            pageIndicator(progressNumber: 2, progressName: "Pihak 2 - Pemberi Peminjam", progressDetail: "Berikutnya: Detail Pinjaman").padding(.bottom, 15)
            List{
                
            }.padding(.horizontal, -35)
            
            ButtonNext(text: "Lanjutkan", isDataComplete: true)
        Spacer()
            
    }.frame(width: UIScreen.main.bounds.width - 35,
            alignment: .leading)
    }
}

struct step2Pemberi_Previews: PreviewProvider {
    static var previews: some View {
        step2Pemberi()
    }
}
