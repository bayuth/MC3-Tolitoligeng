//
//  AgreementCardView.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 02/08/21.
//

import SwiftUI

struct AgreementCardView: View {
	
	var item: Pinjaman
	@ObservedObject var perjanjianController: PerjanjianController = .shared
	
	var body: some View {
		ZStack{
			VStack(alignment: .leading){
				Text(item.kredit?.namaSimulasi ?? "")
					.foregroundColor(Color("textColor"))
					.font(.title2)
					.fontWeight(.semibold)
					.padding(.horizontal)
					.padding(.top, 16)
					.lineLimit(2)
				
				HStack(alignment: .top){
					VStack(alignment: .leading){
						Text("Jumlah Pinjaman")
							.lineLimit(2)
							.font(.footnote)
							.foregroundColor(Color("labelColor"))
							.padding(.bottom, 2)
						
						Text(item.kredit?.jumlahPinjaman.toRupiahString() ?? "")
							.lineLimit(2)
							.foregroundColor(Color("textColor"))
							.padding(.bottom, 8)
						
						Text("Tanggal Pembuatan")
							.lineLimit(2)
							.font(.footnote)
							.foregroundColor(Color("labelColor"))
							.padding(.bottom, 2)
						
						
						Text(getDateString(inputDate: item.dateModified ?? Date()))
							.lineLimit(2)
							.foregroundColor(Color("textColor"))
							.padding(.bottom, 8)
						
					}
					.padding(16)
					.frame(maxWidth: .infinity, alignment: .leading)
					
					VStack(alignment: .leading){
						Text("Pemberi Pinjaman")
							.font(.footnote)
							.foregroundColor(Color("labelColor"))
							.padding(.bottom, 2)
							.lineLimit(2)
						
						
						Text(item.pihak2?.ktp?.nama ?? "")
							.foregroundColor(Color("textColor"))
							.padding(.bottom, 8)
							.lineLimit(2)
						
						Text("Status Tanda Tangan")
							.font(.footnote)
							.foregroundColor(Color("labelColor"))
							.padding(.bottom, 2)
							.lineLimit(2)
						
						
						if item.status == "onGoing"{
							Text("Berjalan")
								.foregroundColor(Color("textColor"))
								.padding(.bottom, 8)
								.lineLimit(2)
						}
						else if item.status == "notSign"{
							Text("Belum Tanda tangan")
								.foregroundColor(Color("textColor"))
								.padding(.bottom, 8)
								.lineLimit(2)
						}
						
						
					}
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(16)
					
				}
			}
			.frame(maxWidth: .infinity)
			.background(
				RoundedRectangle(cornerRadius: 8)
					.foregroundColor(Color("cardColor"))
			)
		}
	}
}


