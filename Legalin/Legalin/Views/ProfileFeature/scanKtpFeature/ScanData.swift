//
//  ScanData.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 02/08/21.
//

import SwiftUI

struct ScanData: Identifiable {
	var id = UUID()
	let content:String
	let nik:String
	let nama:String
	let alamat:String
	let RtRw:String
	let kelurahan:String
	let kecamatan:String
	let kota:String
	let provinsi:String
	
	init(content:String, nama:String, nik:String, alamat:String, RtRw:String, kelurahan:String, kecamatan:String, kota:String, provinsi:String) {
		self.content = content
		self.nik = nik
		self.nama = nama
		self.alamat = alamat
		self.RtRw = RtRw
		self.kelurahan = kelurahan
		self.kecamatan = kecamatan
		self.kota = kota
		self.provinsi = provinsi
	}
	
	var namaEdited:String {
		return cutString(ktpString: nama)
	}
	
	func cutString(ktpString:String) -> String {
		let snippet = self.content

		if let range = snippet.range(of: "Nama\n") {
			let phone = snippet[range.upperBound...]
			print(phone) // prints "123.456.7891"
			return String(phone)
		}
		return ""
	}
}
