//
//  ProfileView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 29/07/21.
//

import SwiftUI

struct ProfileView: View {
		
		@State var nik: String = ""
		@State var nama: String = ""
		@State var birthDate = Date()
		@State var alamat: String = ""
		@State var pekerjaan: String = ""
		@State var nomorHp: String = ""
		
		@ObservedObject var profiledata = profileData()
		
		var body: some View {
			
			NavigationView {
				VStack(alignment: .center) {
					Text("Belum Ada Profil")
						.font(.headline).padding(5)
					Text("Buat profil baru untuk \n mempermudah membuat perjanjian")
						.font(.body)
						.fontWeight(.light)
						.multilineTextAlignment(.center)
						
						.navigationTitle("Profil")
						.padding()
					NavigationLink(
						destination: NewProfileView(),
						label: {
							Text("Buat Profil")
						})
				}
				
			}
			
			//			Text("Hello, \(nama)")
			//			.padding()
			
		}
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
