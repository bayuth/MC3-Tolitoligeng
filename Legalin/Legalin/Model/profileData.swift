//
//  profileData.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 02/08/21.
//

import Foundation
import SwiftUI

class profileData: ObservableObject {
	@Published var id = UUID()
	@Published var nik = ""
	@Published var nama = ""
	@Published var tanggalLahir = Date()
	@Published var alamat = ""
	@Published var Rt = ""
	@Published var Rw = ""
	@Published var Kelurahan = ""
	@Published var Kecamatan = ""
	@Published var Kabupaten = ""
	@Published var Provinsi = ""
	@Published var pekerjaan = ""
	@Published var nomorHp = ""
}
