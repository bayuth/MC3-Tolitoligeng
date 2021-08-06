//
//  FilledProfileView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 02/08/21.
//

import SwiftUI

struct FilledProfileView: View {
	
	@Binding var profile: ScanDataClass
	
    var body: some View {
		VStack {
			List {
				VStack {
					Text("NIK\n\(profile.nik)").font(.body).fontWeight(.thin)
						.multilineTextAlignment(.leading)
				}
				
				VStack {
					Text("Nama\n\(profile.nama)").font(.body).fontWeight(.thin)
						.multilineTextAlignment(.leading)
				}
				
				VStack {
					Text("Tanggal Lahir\n\(profile.tanggalLahir, style:.date)").font(.body).fontWeight(.thin)
						.multilineTextAlignment(.leading)
				}
				
				VStack {
					Text("Alamat\n\(profile.alamat)").font(.body).fontWeight(.thin)
						.multilineTextAlignment(.leading)
				}
				
				VStack {
					Text("Pekerjaan\n\(profile.pekerjaan)").font(.body).fontWeight(.thin)
						.multilineTextAlignment(.leading)
				}
				
				VStack {
					Text("Nomor Handphone\n\(profile.nomorHp)").font(.body)
						.fontWeight(.thin)
						.multilineTextAlignment(.leading)
				}
			}
				
		}
    }
}

//struct FilledProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//		FilledProfileView(profile: )
//    }
//}
