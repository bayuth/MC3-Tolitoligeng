//
//  WebView.swift
//  Todos
//
//  Created by Bradley Hilton on 6/5/19.
//  Copyright © 2019 Brad Hilton. All rights reserved.
//

import SwiftUI
import WebKit

struct GeneratePDF : View {
    
//    let request: URLRequest
    var body: some View {
        VStack{
        WebView()
        }.navigationBarTitle("Tipe Barang", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Batalkan").foregroundColor(.white)
            }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Done")
                        .foregroundColor(.white)
                }
            }.navigationBarBackButtonHidden(true)
    }
}

struct GeneratePDF_Previews: PreviewProvider {
    static var previews: some View {
        GeneratePDF()
    }
}
