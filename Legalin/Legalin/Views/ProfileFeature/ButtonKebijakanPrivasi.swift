//
//  ButtonKebijakanPrivasi.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 17/08/21.
//

import SwiftUI

struct ButtonKebijakanPrivasi: View {
    var body: some View {
		VStack {
			ZStack(alignment: .leading) {
				RoundedRectangle(cornerRadius: 10)
					.frame(width: UIScreen.main.bounds.width - 35, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
					.foregroundColor(Color(#colorLiteral(red: 0.9607843137, green: 0.968627451, blue: 0.9725490196, alpha: 1)))
				HStack {
					Text("Kebijakan Privasi")
						.padding()
					Image(systemName: "chevron.right")
						.padding(.leading)
				}
				
			}
		}
        
    }
}

struct ButtonKebijakanPrivasi_Previews: PreviewProvider {
    static var previews: some View {
        ButtonKebijakanPrivasi()
    }
}
