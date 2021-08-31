//
//  ButtonKebijakanPrivasi.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 17/08/21.
//

import SwiftUI

struct ButtonKebijakanPrivasi: View {
	
	@Environment(\.presentationMode) var kebijakanmode: Binding<PresentationMode>
	
    var body: some View {
//		VStack(alignment: .leading) {
//			ZStack(alignment: .leading) {
//				RoundedRectangle(cornerRadius: 10)
//					.frame(width: UIScreen.main.bounds.width - 35, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//					.foregroundColor(Color("cardColor"))
//				HStack {
//					Text("Kebijakan Privasi")
//						.foregroundColor(Color("textColor"))
//						Spacer()
//					Image(systemName: "chevron.right")
//						.foregroundColor(Color("textColor"))
//						.padding(.leading)
//				}
//				.frame(width: UIScreen.main.bounds.width - 50, height: 55, alignment: .leading)
//			}.clipped()
//		}
		ZStack{
			RoundedRectangle(cornerRadius: 10)
				.foregroundColor(Color("cardColor"))
				.frame(width: UIScreen.main.bounds.width - 30, height: 54, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
				

			VStack(alignment: .leading, spacing: 10, content: {
				
				HStack{
					Text("Kebijakan privasi")
						.foregroundColor(Color("textColor"))
						.font(.body)
						.padding(.leading, 20)
					
					Spacer()
					
					VStack{
					Image(systemName: "chevron.right")
						.foregroundColor(Color("textColor"))
					}.padding(.trailing, 20)
				}
				
				
			}).frame(width: UIScreen.main.bounds.width - 30, height: 54
					 , alignment: .leading)
		}
		
    }
}

struct ButtonKebijakanPrivasi_Previews: PreviewProvider {
    static var previews: some View {
        ButtonKebijakanPrivasi()
    }
}
