//
//  step3Detail.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct step3Detail: View {
    var body: some View {
        VStack(alignment: .leading){
            
            pageIndicator(progressNumber: 3, progressName: "Detail Pinjaman", progressDetail: "Berikutnya: Agunan").padding(.bottom, 15)
            List{
                
            }.padding(.horizontal, -35)
            
            ButtonNext(text: "Lanjutkan", isDataComplete: true)
        Spacer()
            
    }.frame(width: UIScreen.main.bounds.width - 35,
            alignment: .leading)
    }
}

struct step3Detail_Previews: PreviewProvider {
    static var previews: some View {
        step3Detail()
    }
}
