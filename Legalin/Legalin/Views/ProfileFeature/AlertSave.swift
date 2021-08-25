//
//  AlertSave.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 12/08/21.
//

import SwiftUI

struct AlertSave: View {
	
	@Binding var shown:Bool
	@State private var showSaveAlert = false
	@Binding var textField:Bool
	@Environment(\.presentationMode) var saveMode: Binding<PresentationMode>
	@ObservedObject var profileController: ProfileController = .shared
	
	var body: some View {
		ZStack {
			Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
				.opacity(0.4)
				.ignoresSafeArea()
				.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
			VStack{
				Text("Berhasil!").font(.headline).fontWeight(.semibold)
				Text("Profil anda sukses tersimpan").font(.footnote).fontWeight(.regular)
				Image("Profile Filled").frame(width: 50, height: 50, alignment: .center).padding()
				Divider()
				HStack{
					Button("\(Text("Tutup").font(.headline).fontWeight(.semibold))") {
						profileController.updateProfileCoreData()
						shown.toggle()
						textField.toggle()
						self.saveMode.wrappedValue.dismiss()
					}
					.frame(width: UIScreen.main.bounds.width/2-25, height: 30)
					.foregroundColor(Color("tabBarColor"))
				}
			}.frame(width: UIScreen.main.bounds.width-100, height: 200, alignment: .center)
			.background(Color("cardColor"))
			.cornerRadius(12)
			.clipped()
		}
	}
}

struct AlertSave_Previews: PreviewProvider {
	static var previews: some View {
		AlertSave(shown: .constant(false), textField: .constant(false))
	}
}
