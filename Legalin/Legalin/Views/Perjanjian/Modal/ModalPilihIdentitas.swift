//
//  ModalPilihIdentitas.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 22/08/21.
//

import SwiftUI

struct ModalPilihIdentitas: View {
	@Binding var showSheetView:Bool
    var body: some View {
//		NavigationView {
//			.navigationBarTitle("Pilih Identitas")
//			VStack {
//				Text("Kepada Pemberi Pinjaman")
//					.font(.title3)
//					.fontWeight(.semibold)
//					.padding(.horizontal, 20)
//					.padding(.vertical, 5)
//				ScrollView(showsIndicators: false) {
//					CheckListCell(title: "Bambang", selected: false, mainNav: false, index: 0)
//				}
//			}.padding()
//		}
		
		NavigationView {
			ScrollView(showsIndicators:false)  {
				CheckListCell(title: "Bambang", selected: false, mainNav: false, index: 0)
			}
					.navigationBarTitle(Text("Pilih Identitas"), displayMode: .inline)
						.navigationBarItems(trailing: Button(action: {
							print("Dismissing sheet view...")
							self.showSheetView = false
						}) {
							Text("Done").bold().foregroundColor(.white)
						})
				}
    }
}

struct ModalPilihIdentitas_Previews: PreviewProvider {
    static var previews: some View {
		ModalPilihIdentitas(showSheetView: .constant(false))
    }
}
