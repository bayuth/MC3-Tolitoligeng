//
//  ButtonBorderedComingSoon.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 11/08/21.
//

import SwiftUI

struct ButtonBorderedComingSoon: View {
	@State private var showAlert = false
	@State var icon :String
	@State var titleButton :String
	
	var body: some View {
		ZStack{
//			RoundedRectangle(cornerRadius: 10)
//				.border(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))).cornerRadius(10)
//				.foregroundColor(.white)
//				.frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
			Text("\(Image(systemName: "person.fill")) Pilih Identitas (Opsional)").font(.subheadline).foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
				Spacer()
				.overlay(
					RoundedRectangle(cornerRadius: 5)
						.stroke(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)), lineWidth: 2)
						.frame(width: UIScreen.main.bounds.width/1.8, height: 30, alignment: .center)
				)
				
//			HStack {
//				Image(systemName: "person.fill").foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
//				Text("\(titleButton)").fontWeight(.semibold).foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
//			}
			
		}.padding(.horizontal)
		.padding(.bottom)
	}
}

struct ButtonBorderedComingSoon_Previews: PreviewProvider {
    static var previews: some View {
		ButtonBorderedComingSoon(icon: "person.fill", titleButton: "Pilih Identitas (Optional)")
    }
}
