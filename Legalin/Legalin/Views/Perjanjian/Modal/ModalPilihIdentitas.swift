//
//  ModalPilihIdentitas.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 22/08/21.
//

import SwiftUI

struct ModalPilihIdentitas: View {
    var body: some View {
		VStack {
			Text("Kepada Pemberi Pinjaman")
				.font(.title3)
				.fontWeight(.semibold)
				.padding(.horizontal, 20)
				.padding(.vertical, 5)
			ScrollView(showsIndicators: false) {
				CheckListCell(title: "Bambang", selected: false, mainNav: false, index: 0)
			}
		}.padding()
		
    }
}

struct ModalPilihIdentitas_Previews: PreviewProvider {
    static var previews: some View {
        ModalPilihIdentitas()
    }
}
