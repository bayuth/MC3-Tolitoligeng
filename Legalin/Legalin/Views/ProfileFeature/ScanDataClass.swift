//
//  ScanDataClass.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 04/08/21.
//

import SwiftUI

class ScanDataClass: ObservableObject {
	var id = UUID()
//	let content:String
	@Published var nik:String = ""
	@Published var nama:String = ""
	@Published var tanggalLahir:Date = Date()
//	@Published var tanggalLahir:String = ""
	@Published var alamat:String = ""
	@Published var Rt:String = ""
	@Published var Rw:String = ""
	@Published var kelurahan:String = ""
	@Published var kecamatan:String = ""
	@Published var kota:String = ""
	@Published var provinsi:String = ""
	@Published var pekerjaan:String = ""
	@Published var nomorHp:String = ""
	@Published var namaBank:String = ""
	@Published var nomorRekening:String = ""
	@Published var atasNamaRekening:String = ""
	
	init(){
	}
	
	func updateData(nama:String, nik:String, tanggalLahir:Date, alamat:String, Rt:String, Rw:String, kelurahan:String, kecamatan:String, kota:String, provinsi:String, pekerjaan:String, nomorHp:String, namaBank:String, nomorRekening:String, atasNamaRekening:String) {
		
		self.nik = nik
		self.nama = nama
		self.tanggalLahir = tanggalLahir
		self.alamat = alamat
		self.Rt = Rt
		self.Rw = Rw
		self.kelurahan = kelurahan
		self.kecamatan = kecamatan
		self.kota = kota
		self.provinsi = provinsi
		self.pekerjaan = pekerjaan
		self.nomorHp = nomorHp
		self.namaBank = namaBank
		self.nomorRekening = nomorRekening
		self.atasNamaRekening = atasNamaRekening
		print("Masuk nih")
	}
	func update(){
		
	}
}
