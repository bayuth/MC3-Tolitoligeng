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
		
		VStack(alignment: .leading){
			Spacer()
			ScrollView(showsIndicators: false){
				if coreDataVM.listPihak2.count != 0 {
					VStack(alignment: .leading) {
						Text("Pihak 2 - Pilih Identitas")
							.font(.system(size: 17))
							.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
							.padding(.vertical,10)
					}
					.padding(.horizontal)
					.frame(width: UIScreen.main.bounds.width, alignment: .leading)
					
					
					ForEach(0..<coreDataVM.listPihak2.count){item in
						IdentitasCheckList(namaPihak2: coreDataVM.listPihak2[item].ktp?.nama ?? "", nikPihak2: coreDataVM.listPihak2[item].ktp?.nik ?? "", selected: getSelectedStatus(listSelected: vc.listSelected, index: item), mainNav: false, index: item)
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
				} else {
					Text("Tidak ada Profil Pihak 2").frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
				}
				
			}.navigationBarTitle("Pilih Identitas", displayMode: .inline)
//			.accentColor(.red)
			.navigationBarBackButtonHidden(true)
		}
		.padding(.horizontal)
		.background(Color("defaultLightAndDarkColor"))
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
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
				if coreDataVM.listPihak2.count != 0 {
					Text("Done")
						.foregroundColor(.white)
						.onTapGesture {
							isPresented = false
						}
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
