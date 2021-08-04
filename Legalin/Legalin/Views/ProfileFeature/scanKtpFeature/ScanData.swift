//
//  ScanData.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 02/08/21.
//

import Foundation

struct ScanData: Identifiable {
	var id = UUID()
	let content:String
	let nama:String
	
//	init(content:String, nama:String) {
//		self.content = content
//		self.nama = nama
//	}
	
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
