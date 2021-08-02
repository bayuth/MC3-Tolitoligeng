//
//  ModalPengadilanNegeri.swift
//  Legalin
//
//  Created by Jason Hartanto on 02/08/21.
//

import SwiftUI

struct ModalPengadilanNegeri: View {
    
    @StateObject var dataReader = ReadData()
    
    var body: some View {
        Text("\(dataReader.regionData.count)")
    
}

struct ModalPengadilanNegeri_Previews: PreviewProvider {
    static var previews: some View {
        ModalPengadilanNegeri()
    }
}
}
