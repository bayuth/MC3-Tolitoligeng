//
//  ModalPilihIdentitas.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 22/08/21.
//

import SwiftUI

struct ModalPilihIdentitas: View {
	@Binding var isPresented: Bool
	@StateObject var vc = PengadilanDetailController()
	@StateObject var vcKredit = ListKreditVM()
	@ObservedObject var coreDataVM: CoreDataViewModel = .shared
	@ObservedObject var perjanjianController: PerjanjianController = .shared
	@Environment(\.presentationMode) var presentationMode
	
	var body: some View {
		
		VStack{
			Spacer()
			ScrollView(showsIndicators: false){
				Text("Pilih Identitas")
					.font(.system(size: 17))
					.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
					.multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
				Text("\(coreDataVM.listPihak2.count)")
				ForEach(0..<coreDataVM.listPihak2.count){item in
					Text("\(coreDataVM.listPihak2.count)")
					IdentitasCheckList(namaPihak2: coreDataVM.listPihak2[item].ktp?.nama ?? "", nikPihak2: coreDataVM.listPihak2[item].ktp?.nik ?? "", selected: false, mainNav: false, index: item)
						.onTapGesture {
							vc.toggleView(index: item)
							let selectedIdentitas = coreDataVM.listPihak2[item]
							perjanjianController.pihak2NIK = selectedIdentitas.ktp?.nik ?? ""
							perjanjianController.pihak2Nama = selectedIdentitas.ktp?.nama ?? ""
							perjanjianController.pihak2TanggalLahir = selectedIdentitas.ktp?.tanggalLahir ?? Date()
							perjanjianController.pihak2Alamat = selectedIdentitas.ktp?.alamat ?? ""
							
							perjanjianController.pihak2RT = selectedIdentitas.ktp?.rt ?? ""
							perjanjianController.pihak2RW = selectedIdentitas.ktp?.rw ?? ""
							perjanjianController.pihak2Kelurahan = selectedIdentitas.ktp?.kelurahanDesa ?? ""
							perjanjianController.pihak2Kecamatan = selectedIdentitas.ktp?.kecamatan ?? ""
							perjanjianController.pihak2Kota = selectedIdentitas.ktp?.kotaKabupaten ?? ""
							perjanjianController.pihak2Provinsi = selectedIdentitas.ktp?.provinsi ?? ""
							perjanjianController.pihak2Pekerjaan = selectedIdentitas.pekerjaan ?? ""
							perjanjianController.pihak2NomorHP = selectedIdentitas.nomorAktif ?? ""
							perjanjianController.pihak2NamaBank = selectedIdentitas.namaBank ?? ""
							perjanjianController.pihak2NomorRekening = selectedIdentitas.nomorRekening ?? ""
							perjanjianController.pihak2AtasNamaRekening = selectedIdentitas.atasNamaRekening ?? ""
						}
				}
			}.navigationBarTitle("Pilih Identitas", displayMode: .inline)
			.accentColor(.red)
			.navigationBarBackButtonHidden(true)
		}
		.onAppear {
			vc.setListSelected(total: coreDataVM.listPihak2.count)
		}
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				HStack{
					Text("Batalkan").foregroundColor(.white)
				}
				.onTapGesture {
					self.presentationMode.wrappedValue.dismiss()
				}
			}
			
			ToolbarItem(placement: .navigationBarTrailing) {
				Text("Done")
					.foregroundColor(.white)
					.onTapGesture {
						isPresented = false
					}
			}
		}
		
	}
}

struct ModalPilihIdentitas_Previews: PreviewProvider {
    static var previews: some View {
		ModalPilihIdentitas(isPresented: .constant(false))
    }
}
