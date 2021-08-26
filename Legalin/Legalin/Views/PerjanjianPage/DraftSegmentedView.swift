//
//  DraftSegmentedView.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 04/08/21.
//

import SwiftUI

struct DraftSegmentedView: View {
    var item: Pinjaman
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(getPinjamanName(nama: item.kredit?.namaSimulasi ?? "Draft"))
                    .font(.headline)
                
                Text(getDateString(inputDate: item.dateModified ?? Date()))
                    .font(.body)
                    .foregroundColor(Color("labelColor"))
            }
            .padding(16)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color("labelColor"))
                .padding(16)
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color("cardColor"))
        )
    }
    func getPinjamanName(nama:String) -> String{
        if nama == "" {
            return "Draft"
        } else {
            return nama
        }
    }
    
}
func getDateString(inputDate: Date) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "id_ID")
    let dateFormatting = DateFormatter()
    dateFormatting.dateFormat = "dd/MM/YYYY"
    
    return dateFormatting.string(from: inputDate)
}
//struct DraftSegmentedView_Previews: PreviewProvider {
//    static var previews: some View {
//        DraftSegmentedView(item: Pinjaman)
//    }
//}

