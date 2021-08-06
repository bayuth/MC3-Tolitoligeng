//
//  extractKtpInfo.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 03/08/21.
//

import SwiftUI

class extractKtpInfo: ObservableObject {
	
	@Published var name: String
	
	init() {
		name = ""
	}
	
	func textKtpToExtract(textKtpContent: String) -> String {
		
		let namaIndex = textKtpContent.firstIndex(of: ":")!
		let nama = textKtpContent.index(after: namaIndex)
		self.name = String(textKtpContent[nama])
		print(self.name)
		if textKtpContent.contains("Nama") {
			nama
			print(self.name)
		}
		return self.name
	}
}
