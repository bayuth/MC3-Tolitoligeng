//
//  profileData.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 02/08/21.
//

import Foundation
import SwiftUI

class profileData: ObservableObject {
	@Published var nik = ""
	@Published var nama = ""
	@Published var tanggalLahir = Date()
	@Published var alamat = ""
	@Published var pekerjaan = ""
	@Published var nomorHp = ""
}
