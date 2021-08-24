//
//  DatePickerView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 24/08/21.
//

import SwiftUI

struct DatePickerView: View {
	
	@Binding var profileDate:Date
	let dateFormatter: DateFormatter = {
		let df = DateFormatter()
		df.dateStyle = .medium
		return df
	}()
	@Binding var isDisable:Bool
	@State var showTanggalLahir = false
	
    var body: some View {
		if isDisable {
			if Calendar.current.isDateInToday(profileDate) {
				Text("Pilih Tanggal Lahir")
					.font(.body)
					.fontWeight(.regular)
					.foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
			} else {
				Text(profileDate, formatter: dateFormatter)
					.font(.body)
					.fontWeight(.regular)
					.foregroundColor(Color(#colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)))
			}
			
		} else {
			if Calendar.current.isDateInToday(profileDate) {
				Text("Pilih Tanggal Lahir")
					.font(.body)
					.fontWeight(.regular)
					.foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))).onTapGesture {
						showTanggalLahir.toggle()
					}
			} else {
				Text(profileDate, formatter: dateFormatter)
					.font(.body)
					.fontWeight(.regular)
					.foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))).onTapGesture {
						showTanggalLahir.toggle()
					}
			}
			
			if showTanggalLahir {
				DatePicker("", selection: $profileDate, displayedComponents: .date)
					.datePickerStyle(GraphicalDatePickerStyle())
					.padding(.horizontal)
					.accentColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
			}
		}
		
    }
}

//struct DatePickerView_Previews: PreviewProvider {
//    static var previews: some View {
//		DatePickerView(profileDate: Date())
//    }
//}
