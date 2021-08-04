//
//  EmptyStatePerjanjian.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 04/08/21.
//

import SwiftUI

struct EmptyStatePerjanjian: View {
    var body: some View {
        
        VStack(alignment: .center){
            Image("Agreement Empty")
            Text("Tidak Ada Perjanjian")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.top, 48)
                .padding(.bottom, 8)
            
            Text("Tambah Perjanjian baru untuk membuat surat perjanjian hutan")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 57)
                
        }
        
    }
}
