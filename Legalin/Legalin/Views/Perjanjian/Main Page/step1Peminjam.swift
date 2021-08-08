//
//  step1Peminjam.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct step1Peminjam: View {
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            pageIndicator(progressNumber: 1, progressName: "Pihak 1 - Peminjam", progressDetail: "Berikutnya: Pihak 2 - Pemberi Pinjaman").padding(.bottom, 15)
            List{
                
                
            }.padding(.horizontal, -20)
            
            ButtonNext(text: "Lanjutkan", isDataComplete: true)
        Spacer()
            
    }.frame(width: UIScreen.main.bounds.width - 35,
            alignment: .leading)
    }
}

struct step1Peminjam_Previews: PreviewProvider {
    static var previews: some View {
        step1Peminjam()
    }
}
