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
    
    
    @Environment(\.presentationMode) var presentationMode
//    let request: URLRequest
    var body: some View {
        VStack{
        WebView()
        }.navigationBarTitle("Draft PDF", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.white)
                                    Text("Kembali")
                                        .foregroundColor(.white)
                                })
        )
    }
}

struct GeneratePDF_Previews: PreviewProvider {
    static var previews: some View {
        GeneratePDF()
    }
}
